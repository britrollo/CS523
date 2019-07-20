//
//  PinLocation.swift
//  Maps
//
//  Created by Brianne Trollo on 3/4/19.
//  Copyright © 2019 Brianne Trollo. All rights reserved.
//
// I pledge my honor that I have abided by the Stevens Honor System.
// Brianne Trollo

import UIKit
import MapKit

class PinLocation: NSObject, MKAnnotation {
    var identifier = "pin"
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var image: String?
    init(name: String, sub:String, lat:CLLocationDegrees, long:CLLocationDegrees, img: String){
        title = name
        subtitle = sub
        coordinate = CLLocationCoordinate2DMake(lat, long)
        image = img
    }
}

class PinList: NSObject {
    var locations = [PinLocation]()
    override init(){
        locations += [PinLocation(name: "CPH", sub: "Freshman dormitory", lat: 40.746833, long:  -74.024168, img: "res")]
        locations += [PinLocation(name: "Howe", sub: "Dining Hall and Offices", lat: 40.744793, long: -74.023820, img: "office")]
        locations += [PinLocation(name: "Samuel C. Williams Library", sub: "Student Library", lat: 40.744775, long:  -74.025237, img: "book")]
        locations += [PinLocation(name: "Walker Gym", sub: "Varsity Gym", lat: 40.743803, long:  -74.025760, img: "sport")]
        locations += [PinLocation(name: "North Building", sub: "Computer Science Dept", lat: 40.746173, long: -74.025196, img: "computer")]
        locations += [PinLocation(name: "Morton", sub: "CAL Dept", lat: 40.743185, long: -74.026650, img: "art")]
        locations += [PinLocation(name: "Babbio", sub: "Business School", lat: 40.742622, long: -74.026658, img: "finance")]
        locations += [PinLocation(name: "Davis Hall", sub: "Freshman dormitory", lat: 40.743377, long: -74.025678, img: "home")]
        locations += [PinLocation(name: "Palmer Hall", sub: "Freshman dormitory", lat: 40.745338, long: -74.025033, img: "dorm")]
        locations += [PinLocation(name: "Schaefer Gym", sub: "Gym and Fitness Center", lat: 40.744305, long: -74.025776, img: "gym")]

    }
}
