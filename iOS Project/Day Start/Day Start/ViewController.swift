import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lon: UILabel!
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 현재 위치한 데이터 수신(정확도)
        locationManager.requestWhenInUseAuthorization() // 위치정보에 대한 승인요청
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation() // 현재 위치에 대해 update
        } else {
            print("--> CLLocation error!!")
        }
    }
    
    func getLocation() {
        
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
        
        guard let currentCordinate = manager.location?.coordinate else { return }
        printAddressBasedOnGPS(lat: currentCordinate.latitude, lon: currentCordinate.longitude)
    }
    
    func printAddressBasedOnGPS(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let location = CLLocation(latitude: lat, longitude: lon)
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        
        geocoder.reverseGeocodeLocation(location) { (placemark, error) in
            guard let address: [CLPlacemark] = placemark else { return }
            // name: 정왕동 1277-5
            // locality: 시흥시
        }
    }
}

