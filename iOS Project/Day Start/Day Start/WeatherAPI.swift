import Foundation

class WeatherAPI {
    static let shared = WeatherAPI()
    
    let API_KEY = "25364466d5ba5b4956350f7b3fed5dfb"
    var lat: Double = 36.0
    var lon: Double = 127.0
    
    func getData(){
        let session = URLSession(configuration: .default)
        guard let requestURL = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=36&lon=127&exclude=minutely&appid=25364466d5ba5b4956350f7b3fed5dfb") else { return }
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            guard error == nil else { return }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200..<300).contains(statusCode), let resultData = data else { return }
            
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(WeatherResponse.self, from: resultData)
                print("--> response: \(response.hourly.first?.dt)")
                
            } catch let error {
                print("--> error: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
