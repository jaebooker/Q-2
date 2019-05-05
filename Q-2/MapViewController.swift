//
//  MapViewController.swift
//  Q-2
//
//  Created by Jaeson Booker on 5/4/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

    @IBOutlet weak var mapKit: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createAnnotations(locations: testArray)
        // Do any additional setup after loading the view.
    }
    let zoomDistance: CLLocationDistance = 5000
    func zoomLevel(location: CLLocation){
        //create new region
        let mapCoordinates = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: zoomDistance, longitudinalMeters: zoomDistance)
        //set region
        mapKit.setRegion(mapCoordinates, animated: true)
    }
    let testArray = [
        ["title": "title","latitude":37.0534,"longitude":37.243]
    ]
    func createAnnotations(locations: [[String: Any]]) {
        for l in locations {
            let annotations = MKPointAnnotation()
            annotations.title = l["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: l["latitude"] as! CLLocationDegrees, longitude: l["longitude"] as! CLLocationDegrees)
            mapKit.addAnnotation(annotations)
            let clLocation = CLLocation(latitude: l["latitude"] as! CLLocationDegrees, longitude: l["longitude"] as! CLLocationDegrees)
            //set location to be current test data
            zoomLevel(location: clLocation)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
