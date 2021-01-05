import Foundation

class NetworkHandlerToDelegate {
    
    func getData(person : String) {
        let session = URLSession(configuration: .default, delegate:MyDelegate(), delegateQueue: .current)
        guard let requestURL = makeURL(person: person) else { return }
        
        let dataTask = session.dataTask(with: requestURL)
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


class MyDelegate : NSObject {

}

extension MyDelegate : URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(Response.self, from: data)
            let tracks = response.tracks
            print("--> tracks : \(tracks)")
        } catch let error {
            print("--> error : \(error.localizedDescription)")
        }
    }
}

extension MyDelegate : URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("--> Task complete!!!")
        session.invalidateAndCancel()
    }
}


