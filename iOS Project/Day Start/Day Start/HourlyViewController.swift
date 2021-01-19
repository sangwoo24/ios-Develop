import Foundation
import UIKit
import Kingfisher

class HourlyViewController: UIViewController {
    @IBOutlet weak var hourlyCollectionView: UICollectionView!
    
    let weatherViewModel = WeatherViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
        print("hourly")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension HourlyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherViewModel.numberOfHourly ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hourlyCell", for: indexPath) as? HourlyCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let hourly = weatherViewModel.getIndexOfHourly(index: indexPath.item) else { return UICollectionViewCell() }
        cell.updateCell(hourly: hourly)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 160)
    }
    
    func reload() {
        self.hourlyCollectionView.reloadData()
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
