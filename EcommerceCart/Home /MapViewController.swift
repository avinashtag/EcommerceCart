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
    
    @IBAction func startTheJourney(_ sender: UIButton) {
        fetchAndMoveCarAlongRoute(mapView: mapView)
    }
    
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
    
    func moveCarAlongRoute(routeCoordinates: [CLLocationCoordinate2D]) {
        guard !routeCoordinates.isEmpty else {
            print("No coordinates provided for the route.")
            return
        }
        
        let routePolyline = MKPolyline(coordinates: routeCoordinates, count: routeCoordinates.count)
            mapView.addOverlay(routePolyline)
        
        // Create an UIImageView for the car using SF Symbol
        let carMarker = UIImageView(image: UIImage(systemName: "car.fill"))
        carMarker.tintColor = .blue
        carMarker.frame = CGRect(x: 0, y: 0, width: 30, height: 30) // Set size of the car marker
        
        // Add the car marker to the mapView as a subview
        mapView.addSubview(carMarker)
        
        // Set the initial position of the car marker
        var currentStepIndex = 0
        let initialCoordinate = routeCoordinates[currentStepIndex]
        carMarker.center = mapView.convert(initialCoordinate, toPointTo: mapView)

        // Create a timer to move the car along the route
        Timer.scheduledTimer(withTimeInterval: 0.00001, repeats: true) { timer in
            // Stop the timer when all coordinates have been traversed
            if currentStepIndex >= routeCoordinates.count {
                timer.invalidate()
                return
            }

            // Get the next coordinate in the route
            let nextCoordinate = routeCoordinates[currentStepIndex]
            
            // Convert geographic coordinate to a screen point
            let screenPoint: CGPoint = self.mapView.convert(nextCoordinate, toPointTo: self.mapView)

            // Move the car marker smoothly to the new screen point
            UIView.animate(withDuration: 0.05) {
                carMarker.center = screenPoint
            }

            // Increment to the next step
            currentStepIndex += 1
        }
    }


    // Function to fetch the route and move the car
    func fetchAndMoveCarAlongRoute(mapView: MKMapView) {
        let urlString = "https://router.project-osrm.org/route/v1/driving/77.1025,28.7041;72.8777,19.0760?overview=full&geometries=geojson"
        guard let url = URL(string: urlString) else {
            print("cannot convert it to URL")
            return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching route: \(error)")
                return
            }
            
            guard let data = data else { print("no data fetched")
                return }
            
            if let routeCoordinates = parseRouteCoordinates(from: data) {
                DispatchQueue.main.async {
                    self.moveCarAlongRoute(routeCoordinates: routeCoordinates)
                }
            }
        }.resume()
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
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = UIColor.red // Set the color of the route
                renderer.lineWidth = 4.0 // Set the width of the route
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
}

//Route
//Own current location




// Call api in 1(x) sec recursively
//Delgate method - Notification method - apple notication or any other notification - push
// Socket programming - 22 port
// xmpp protocol - chat only
