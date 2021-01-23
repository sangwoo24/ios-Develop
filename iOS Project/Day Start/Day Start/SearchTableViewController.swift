import UIKit
import CoreLocation

class SearchTableViewController: UIViewController {

    @IBOutlet weak var locationSearchBar: UISearchBar!
    @IBOutlet weak var locationTableView: UITableView!
    
    let locationManager = CLLocationManager()
    let weatherAPI = WeatherAPI.shared
    let weatherViewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationSearchBar.delegate = self
    }
    
    func getSearchedWeatherResponse(latitude: CLLocationDegrees, longitude: CLLocationDegrees, currentLocation: String) {
        weatherAPI.getData(lat: latitude, lon: longitude) { WeatherResponse in
            guard var weatherResponse = WeatherResponse else { return }

            DispatchQueue.main.async {
                weatherResponse.currentLocaiton = currentLocation
                self.weatherViewModel.addWeatherResponse(response: weatherResponse)
                self.locationTableView.reloadData()
            }
        }
    }
    
    func updateCurrentWeatherResponse(response: WeatherResponse) {
        if self.weatherViewModel.numberOfWeatherResponse == 0 {
            self.weatherViewModel.addWeatherResponse(response: response)
        } else {
            if let firstIndexOfResponse = self.weatherViewModel.indexOfWeatherResponse(index: 0) {
                guard firstIndexOfResponse.isMyLocation != nil else {
                    // myLocation = nil
                    self.weatherViewModel.insertWeatherResponse(response: firstIndexOfResponse, index: 0)
                    return
                }
                self.weatherViewModel.replaceWeatherResponse(response: firstIndexOfResponse, index: 0)
            }
        }
    }
}

// MARK: TableView
extension SearchTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherViewModel.numberOfWeatherResponse
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        guard let cellResponseData = self.weatherViewModel.indexOfWeatherResponse(index: indexPath.row) else { return UITableViewCell() }
        cell.updateCell(weatherResponse: cellResponseData)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        guard let weatherVC = sb.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController else { return }
        
        weatherVC.weatherResponse = self.weatherViewModel.indexOfWeatherResponse(index: indexPath.row)
        self.present(weatherVC, animated: true, completion: nil)
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
        
        geocoder.geocodeAddressString(searchTerm) { placemark, error in
            guard let coordinate = placemark?.first?.location?.coordinate, let placemark = placemark?.first else {
                print("--> error: String to Location Fail")
                return
            }
            let currentLocation = self.getCurrentLocationToString(placemark: placemark)
            self.getSearchedWeatherResponse(latitude: coordinate.latitude, longitude: coordinate.longitude, currentLocation: currentLocation)
        }
    }
    
    func getCurrentLocationToString(placemark: CLPlacemark) -> String {
        let currentLocationToString = placemark.subLocality ?? (placemark.administrativeArea ?? (placemark.locality ?? self.locationSearchBar.text ?? ""))
        return currentLocationToString
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // manager: locationManager 객체
        // location: 위치 데이터값인 CLLocation의 배열 (배열은 현재의 마지막 위치에 대한 데이터를 포함, 데이터를 전송하기 전에 여러 개 위치가 저장될 수 있기 때문에 배열로 전달)

        // [] 좌표 정보 못받을 시 처리
        guard let currentCordinate = manager.location?.coordinate else { return }
        weatherAPI.getData(lat: currentCordinate.latitude, lon: currentCordinate.longitude) { WeatherResponse in
            guard var currentLocationResponse = WeatherResponse else { return }
            currentLocationResponse.isMyLocation = true
            currentLocationResponse.currentLocaiton = "Current"
            
            self.updateCurrentWeatherResponse(response: currentLocationResponse)
        }
    }
}

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    
    func updateCell(weatherResponse: WeatherResponse) {
        self.layer.cornerRadius = 10
        self.currentTemp.text = "\(Int((weatherResponse.current.temp - 273.15).rounded())) °C"
        self.currentTimeLabel.text = Date.timezoneToTime(timezone: weatherResponse.timezone)
        if let currentLocation = weatherResponse.currentLocaiton {
            self.locationLabel.text = currentLocation
        }
    }
}

