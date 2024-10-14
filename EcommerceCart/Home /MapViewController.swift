//
//  MapViewController.swift
//  EcommerceCart
//
//  Created by Avinash on 14/10/2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        // Do any additional setup after loading the view.
        
        addPinsOnMap()
    }
    
    func addPinsOnMap(){
        
        let annotaionDelhi = MKPointAnnotation()
        annotaionDelhi.title = "Delhi"
        annotaionDelhi.coordinate = CLLocationCoordinate2D( latitude: 28.7041, longitude: 77.1025)
        mapView.addAnnotation(annotaionDelhi)
        
        
        let annotaionMumbai = MKPointAnnotation()
        annotaionMumbai.title = "Mumbai"
        annotaionMumbai.coordinate = CLLocationCoordinate2D( latitude: 19.0760, longitude: 72.8777)
        mapView.addAnnotation(annotaionMumbai)

        
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

extension MapViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        
//        if annotation == MKUserLocation{ return nil }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Custom")
        if annotationView == nil{
            //Create AnnotationView
             annotationView = MKAnnotationView()
        }
        else{
            //Reuse the AnnotationView
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Custom")
        }
        
        switch annotation.title{
            
        case "Delhi":
            annotationView?.image = UIImage(systemName: "shippingbox")
            
        case "Mumbai":
            annotationView?.image = UIImage(systemName: "shippingbox")

        default: break
        }
        
        return annotationView
        
    }
}

//Route
//Own current location




// Call api in 1(x) sec recursively
//Delgate method - Notification method - apple notication or any other notification - push
// Socket programming - 22 port
// xmpp protocol - chat only
