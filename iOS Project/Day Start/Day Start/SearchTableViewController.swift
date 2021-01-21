import UIKit
import CoreLocation

class SearchTableViewController: UIViewController {

    @IBOutlet weak var locationSearchBar: UISearchBar!
    @IBOutlet weak var locationTableView: UITableView!
    var model: [WeatherResponse] = []
    
    let locationManager = CLLocationManager()
    let weatherAPI = WeatherAPI.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationSearchBar.delegate = self
    }
    
    func getWeatherResponse(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        weatherAPI.getData(lat: latitude, lon: longitude) { WeatherResponse in
            guard let WeatherResponse = WeatherResponse else { return }
            self.model.append(WeatherResponse)
            print(self.model.last?.lat)
            print(self.model.last?.lon)
        }
    }
}

// MARK: TableView
extension SearchTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: Search Bar
extension SearchTableViewController: UISearchBarDelegate {
    private func dismissKeyboard() {
        self.locationSearchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search!")
        dismissKeyboard()
        guard let searchTerm = self.locationSearchBar.text, searchTerm.isEmpty == false else { return }
        getLocationFromSearchTerm(searchTerm: searchTerm)
    }
}

// MARK: Location
extension SearchTableViewController: CLLocationManagerDelegate {
    func getCurrentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 현재 위치한 데이터 수신(정확도)
        locationManager.requestWhenInUseAuthorization() // 위치정보에 대한 승인요청
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation() // 현재 위치에 대해 update
        } else {
            print("--> CLLocation error!!")
        }
    }
    
    func getLocationFromSearchTerm(searchTerm: String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(searchTerm) { (placemark, error) in
            guard let coordinate = placemark?.first?.location?.coordinate, let location = placemark?.first else {
                print("--> error: String to Location Fail")
                return
            }
            print("location: \(location.location), \(location.locality), \(location.subLocality)")
            self.getWeatherResponse(latitude: coordinate.latitude, longitude: coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // manager: locationManager 객체
        // location: 위치 데이터값인 CLLocation의 배열 (배열은 현재의 마지막 위치에 대한 데이터를 포함, 데이터를 전송하기 전에 여러 개 위치가 저장될 수 있기 때문에 배열로 전달)

        guard let currentCordinate = manager.location?.coordinate else { return }
        let lat = Double(currentCordinate.latitude)
        let lon = Double(currentCordinate.longitude)
        
        // 현재위치 바뀌면 첫번째 셀 정보 변경.
        weatherAPI.getData(lat: 36, lon: 127) { WeatherResponse in
            // response 를 model 배열에 첫번째 원소와 교체
            // tableView reload 수행
        }
    }
}

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
}
