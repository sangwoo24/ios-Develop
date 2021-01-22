import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var hourlyContainerView: UIView!
    @IBOutlet weak var currentTimezoneLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    
    
    let locationManager = CLLocationManager()
    var weatherViewModel = WeatherViewModel()
    let weatherAPI = WeatherAPI.shared
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
                // [] current, hourly, daily 각 view 에 할당.
                self.updateHourlyView()
                self.updateCurrentView()
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
    
    func updateHourlyView() {
        self.hourlyView?.hourlyCollectionView.reloadData()
    }
    
    func updateCurrentView() {
//        if let current = self.weatherViewModel.current, let imageName = current.weather.first?.icon {
//            let url = URL(string: "http://openweathermap.org/img/wn/\(imageName)@2x.png")
//            
//            self.currentTempLabel.text = "\((current.temp - 273.15).rounded())"
//            self.currentTimezoneLabel.text = self.weatherViewModel.timezone
//            self.currentWeatherImage.kf.setImage(with: url)
//        }
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
        }
    }
}

