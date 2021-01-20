import Foundation
import UIKit
import Kingfisher

class HourlyViewController: UIViewController {
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    let weatherViewModel = WeatherViewModel()
    var hour: [Hourly] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
    }
    
    func reload(hourly: [Hourly]) {
        self.hour = hourly
    }
    
    @IBAction func button(_ sender: Any) {
        print(self.hour.count)
        self.hourlyCollectionView.reloadData()
    }
}

extension HourlyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.hour.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hourlyCell", for: indexPath) as? HourlyCollectionViewCell else {
            return UICollectionViewCell()
        }
//        guard let hourly = weatherViewModel.getIndexOfHourly(index: indexPath.item) else { return UICollectionViewCell() }
        let hourly = hour[indexPath.item]
        cell.updateCell(hourly: hourly)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 130)
    }
}

class HourlyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var hourlyTime: UILabel!
    @IBOutlet weak var hourlyWeatherImage: UIImageView!
    @IBOutlet weak var hourlyTemp: UILabel!
    
    func updateCell(hourly: Hourly) {
        // [] dt 변환 후 값 넣어주기
        guard let imageName = hourly.weather.first?.icon else { return }
        let url = URL(string: "http://openweathermap.org/img/wn/\(imageName)@2x.png")
        
        self.hourlyTime.text = Date.getTime(dt: hourly.dt)
        self.hourlyWeatherImage.kf.setImage(with: url)
        self.hourlyTemp.text = "\(hourly.temp)"
        
    }
}


