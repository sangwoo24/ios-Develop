import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    let weatherViewModel = WeatherViewModel()
    let weatherAPI = WeatherAPI.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
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
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let api = WeatherAPI.shared
//        //api.getData()
//    }
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
            if let current = weatherResponse?.current {
                print("--> current: \(current)")
            }
        }
    }
}

