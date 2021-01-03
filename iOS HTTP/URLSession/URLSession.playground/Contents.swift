import UIKit

// URL

let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)


url?.absoluteString     // 실제 주소
url?.scheme             // http 프로토콜
url?.host               // host
url?.path               // host 뒤의 path
url?.query              // 검색어에 대한 정보, 조건
url?.baseURL


let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon",relativeTo: baseURL)


relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL


// URLComponents
// 한글 x -> 인코딩을 해줘야 함

// query를 제외한 string
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")

let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)
let requestURL = urlComponents?.url!


urlComponents?.url
urlComponents?.string
urlComponents?.queryItems
urlComponents?.queryItems?.last?.value

// 지드래곤을 Server가 이해할 수 있는 말로 인코딩이 된다 -> EC%A7%80%EB%93%9C%EB%9E%98%EA%B3%A4
// 띄어쓰기, 한국어, 일본어 등은 % 인코딩이 필요하다.
