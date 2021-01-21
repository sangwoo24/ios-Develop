import CoreLocation


func getLocation(from address: String) {
        guard let address = address as? String else { return }
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks,
            let location = placemarks.first?.location else {
                return
            }
            print(placemarks.first?.location?.coordinate.latitude)
            print(placemarks.first?.location?.coordinate.longitude)
            print(placemarks.first?.locality)
        }
    }


getLocation(from: "정왕동 1277")
