//
//  ViewController.swift
//  Maps
//
//  Created by Brianne Trollo on 3/2/19.
//  Copyright © 2019 Brianne Trollo. All rights reserved.
//
// I pledge my honor that I have abided by the Stevens Honor System.
// Brianne Trollo

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var distanceSpan: CLLocationDistance = 3000
    
    @IBAction func zoomOut(_ sender: Any, forEvent event: UIEvent) {
        let origSpan = self.distanceSpan
        self.distanceSpan = origSpan + 200
        resetRegion()
    }
    
    @IBAction func zoomIn(_ sender: Any, forEvent event: UIEvent) {
        let origSpan = self.distanceSpan
        self.distanceSpan = origSpan - 200
        resetRegion()
     }
    
    @IBAction func standardMap(_ sender: Any) {
        self.map.mapType = MKMapType.standard
    }
    
    @IBAction func satelliteMap(_ sender: Any) {
        self.map.mapType = MKMapType.satellite
    }
    
    @IBAction func hybridMap(_ sender: Any) {
        self.map.mapType = MKMapType.hybrid
    }
    
    let homeLoc = CLLocationCoordinate2DMake(40.745078, -74.024854)
    let locations = PinList().locations
    
    func resetRegion() {
        let region = MKCoordinateRegion(center: homeLoc, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
        map.setRegion(region, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetRegion()
        map.addAnnotations(locations)
        self.map.delegate = self
        self.map.mapType = MKMapType.standard
        self.map.isZoomEnabled = true
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? PinLocation {
            if let view = map.dequeueReusableAnnotationView(withIdentifier: annotation.identifier) {
                return view
            } else {
                let view = MKAnnotationView(annotation: annotation, reuseIdentifier: annotation.identifier)
                view.isEnabled = true
                view.canShowCallout = true
                view.image = UIImage(named: annotation.image!)
                return view
            }
        }
        return nil
    }
}
