import Foundation

class NetworkHandler {
    static let shared = NetworkHandler()
    
    func getData(person : String) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        guard let requestURL = makeURL(person: person) else {
            print("--> URL error")
            return
        }
        
        let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
            guard error == nil else { return }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
            let successRange = 200..<300
            
            guard successRange.contains(statusCode) else { return }
            
            guard let resultData = data else { return }

            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: resultData)
                let tracks = response.tracks
                
                print("--> tracks: \(tracks)")
            } catch let error {
                print("--> error \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    func makeURL(person : String) -> URL? {
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")
        let mediaQuary = URLQueryItem(name: "media", value: "music")
        let entityQuary = URLQueryItem(name: "entity", value: "song")
        let termQuary = URLQueryItem(name: "term", value: person)
        
        urlComponents?.queryItems?.append(mediaQuary)
        urlComponents?.queryItems?.append(entityQuary)
        urlComponents?.queryItems?.append(termQuary)
        
        return urlComponents?.url
    }
}

struct Response : Codable{
    let resultCount : Int
    let tracks : [Track]
    
    enum CodingKeys : String, CodingKey {
        case resultCount
        case tracks = "results"
    }
    
}

struct Track : Codable {
    let title : String
    let artistName : String
    let thumbnailPath : String
    
    enum CodingKeys : String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl30"
    }
}
