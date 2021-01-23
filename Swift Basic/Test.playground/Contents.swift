import CoreLocation


func getLocation(from address: String) {
    guard let address = address as? String else { return }
    let geocoder = CLGeocoder()
    geocoder.loc
    geocoder.geocodeAddressString(address) { (placemarks, error) in
        guard let placemarks = placemarks,
              let location = placemarks.first?.location else {
            return
        }
        
        print(placemarks.first?.administrativeArea)
        print(placemarks.first?.locality)
    }
}


getLocation(from: "서울특별시 노원구")    // 시, 군, 구 까지
    
// name < locality < administrativeArea
// 서울특별시 노원구 -> 서울, 노원구, 노원구
// 경기도 광주시 -> 경기도, 광주시, 광주시
// 곤지암 -> 경기도, 광주시, 곤지암리
// 베이징 -> 베이징, 베이징, 베이징
// 방학동 -> 서울, 도봉구, 방학동
// 곤지암읍 -> 경기도, 광주시, 곤지암읍
// 서울시 동작구 -> 서울시 동작구

var a: String?
var b: String? = "안녕"


print((a ?? "") + (b ?? ""))


