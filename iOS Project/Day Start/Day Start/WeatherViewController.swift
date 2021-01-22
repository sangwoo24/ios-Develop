import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var currentContainerView: UIView!
    @IBOutlet weak var hourlyContainerView: UIView!
    @IBOutlet weak var dailyContainerView: UIView!
    
    // let 은 안되는 이유!?
    var currentView: CurrentViewController?
    var hourlyView: HourlyViewController?
    var dailyView: DailyViewController?
    var weatherResponse: WeatherResponse?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherData = self.weatherResponse else { return }
        
        if segue.identifier == "current" {
            currentView = segue.destination as? CurrentViewController
            currentView?.current = weatherData.current
        } else if segue.identifier == "hourly" {
            hourlyView = segue.destination as? HourlyViewController
            hourlyView?.hourly = weatherData.hourly
        } else if segue.identifier == "daily" {
            dailyView = segue.destination as? DailyViewController
            dailyView?.daily = weatherData.daily
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateHourlyView() {
        self.hourlyView?.hourlyCollectionView.reloadData()
    }
    
    func updateCurrentView() {
    }
}

