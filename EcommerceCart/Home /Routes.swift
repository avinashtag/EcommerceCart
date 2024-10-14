

import MapKit

struct RouteResponse: Codable {
    let routes: [Route]
}

struct Route: Codable {
    let geometry: Geometry
}

struct Geometry: Codable {
    let coordinates: [[Double]]
}

// Function to parse coordinates from GeoJSON
func parseRouteCoordinates(from jsonData: Data) -> [CLLocationCoordinate2D]? {
    do {
        let routeResponse = try JSONDecoder().decode(RouteResponse.self, from: jsonData)
        let coordinatesArray = routeResponse.routes.first?.geometry.coordinates ?? []
        let coordinates = coordinatesArray.map { CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0]) }
        return coordinates
    } catch {
        print("Failed to parse route: \(error)")
        return nil
    }
}
