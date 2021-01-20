import UIKit
import CoreLocation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var hourlyContainerView: UIView!
    @IBOutlet weak var collection: UICollectionView!
    
    let locationManager = CLLocationManager()
    let weatherViewModel = WeatherViewModel()
    let weatherAPI = WeatherAPI.shared
    var model: [Hourly] = []
    
    // let 은 안되는 이유!?
    var hourlyView: HourlyViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hourly" {
            hourlyView = segue.destination as? HourlyViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getLocation()
        weatherAPI.getData(lat: 36, lon: 127) { (weatherResponse) in
            DispatchQueue.main.async {
                guard let hour = weatherResponse?.hourly else { return }
                self.model = hour
                self.collection.reloadData()
                
                self.hourlyView?.reload(hourly: hour)
            }
        }
    }
    
    func getLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 현재 위치한 데이터 수신(정확도)
        locationManager.requestWhenInUseAuthorization() // 위치정보에 대한 승인요청
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation() // 현재 위치에 대해 update
        } else {
            print("--> CLLocation error!!")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hourlyCell", for: indexPath) as? HourlyCollectionViewCell else { return UICollectionViewCell() }
        
        let hour = self.model[indexPath.item]
        cell.updateCell(hourly: hour)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 130)
    }
}


extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // manager: locationManager 객체
        // location: 위치 데이터값인 CLLocation의 배열 (배열은 현재의 마지막 위치에 대한 데이터를 포함, 데이터를 전송하기 전에 여러 개 위치가 저장될 수 있기 때문에 배열로 전달)
        // [] 위치 받고 lat, lon 으로 현재날씨 받아옴
        // [] 날씨를 기반하여 view update
        
        // [x] api 검색
        guard let currentCordinate = manager.location?.coordinate else { return }
        let lat = Double(currentCordinate.latitude)
        let lon = Double(currentCordinate.longitude)
        weatherAPI.getData(lat: lat, lon: lon) { (weatherResponse) in
            DispatchQueue.main.async {
                guard let response = weatherResponse else { return }
                self.weatherViewModel.setWeather(response)
                guard let hour = weatherResponse?.hourly else { return }
            }
        }
    }
}
