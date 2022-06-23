//
//  MyPin.swift
//  MapView
//
//  Created by iOSTeam on 23/06/2022.
//

import Foundation
import MapKit

class MyPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let title: String?
    let locationName: String
    
    init(coordinate: CLLocationCoordinate2D, title: String, locationName: String) {
        self.locationName = locationName
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
    var subtitle: String? {
            return locationName
        }
    
}
