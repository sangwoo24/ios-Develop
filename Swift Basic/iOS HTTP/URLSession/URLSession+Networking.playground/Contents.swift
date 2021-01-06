import UIKit

// URLSession

// 1. URLSessionConfiguration
// 2. URLSession
// 3. URLSessionTask 를 이용해서 서버와 네트워킹

// URLSessionTask

// - dataTask
// - uploadTask
// - downloadTask


let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")

urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)
let requestURL = urlComponents.url!




// struct
struct Response : Codable{
    let resultCount : Int
    let tracks : [Track]
    
    enum CodingKeys : String, CodingKey {
        case resultCount
        case tracks = "results"
    }
    
}

struct Track : Codable {        // Codable Protocol 준수
    let title : String
    let artistName : String
    let thumbnailPath : String  // Image의 URL 주소를 담기 위한 Property
    
    // 실제 업무에서는 필요한 Data 만 Json으로 내려주고, KeyName을 맞추기 때문에 많이 사용은 x
    enum CodingKeys : String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl30"
    }
    
    // trackName - title
    // artistName - artistName
    // artworkUrl30 - thumbnailPath
}




// 목적 URL 과 수행 후의 completion
let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
    guard error == nil else { return }
    
    // header의 status code가 2xx 여야만 성공적인 네트워킹
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    //print("---> result : \(resultString)")
    
    
    
    
    /*                         목표 : Track 리스트를 Object로 가져오기                         */
    
    // 하고 싶은 욕구 목록
    // - Data -> Track 목록으로 가져오고 싶다 [Track]
    // - Track Object를 만들어야겠다
    // - Data에서 struct로 파싱하고 싶다 -> Codable을 이용하여 만들자
    //   - Json 파일, 데이터 -> Object (Codable 이용)
    //   - Response ,Track 두 개의 struct가 필요함
    
    
    // 해야 할 일
    // 1. Response, Track 의 struct 만들기
    // 2. struct의 Property 이름과 실제 Data의 Key와 맞추기 (맞춰야 Codable에서 Decoding이 가능함)
    // 3. Passing (Decoding)
    // 4. Track 리스트 가져오기
    
    
    
    
    // Passing 및 Track 가져오기
    do{
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        
        print("--> tracks: \(tracks.count)")
    } catch let error {
        print("--> error \(error.localizedDescription)")
    }
}

// dataTask 실행
dataTask.resume()


// 결론
// - 이 방법은 효율적이지는 못한 방법임 -> 현업에서는 Request, Response에 대한 Data의 규칙을 정하기 때문에 더 간편하게 처리가 가능함

