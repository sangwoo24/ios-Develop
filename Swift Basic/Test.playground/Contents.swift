import Foundation

let API_KEY = "25364466d5ba5b4956350f7b3fed5dfb"
var lat: Double = 36.0
var lon: Double = 127.0

let s = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(API_KEY)"

print(s)
