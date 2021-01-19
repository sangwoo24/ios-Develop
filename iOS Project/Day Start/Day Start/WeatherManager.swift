import Foundation

class WeatherManager {
    static let shared = WeatherManager()
    var weather: WeatherResponse?
    
    func getCordinates() -> [Double] {
        var cordinates: [Double] = []
        if let lat = self.weather?.lat, let lon = self.weather?.lon {
            cordinates.append(lat)
            cordinates.append(lon)
        }
        return cordinates
    }
    
    func getCurrentWeather() -> Current? {
        guard let current = self.weather?.current else { return nil }
        return current
    }
    
    func getHourly() -> [Hourly]? {
        guard let hourly = self.weather?.hourly else { return nil }
        return hourly
    }
    
    func getDaily() -> [Daily]? {
        guard let daily = self.weather?.daily else { return nil }
        return daily
    }
}



class WeatherViewModel {
    private let manager = WeatherManager.shared
    
    var currentCordinates: [Double] {
        return manager.getCordinates()
    }
    
    var current: Current? {
        return manager.getCurrentWeather()
    }
    
    var hourly: [Hourly]? {
        return manager.getHourly()
    }
    
    var daily: [Daily]? {
        return manager.getDaily()
    }
    
    var numberOfHourly: Int? {
        return manager.getHourly()?.count
    }
    
    var numberOfDaily: Int? {
        return manager.getDaily()?.count
    }
}
