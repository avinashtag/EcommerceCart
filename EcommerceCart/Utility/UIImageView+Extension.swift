//
//  ImageView+extension.swift
//  EcommerceCart
//
//  Created by Bhavya on 29/09/24.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        // Start a background task to download the image
        DispatchQueue.global().async { [weak self] in
            // Download image data from URL
            let config = URLSessionConfiguration.default
            config.requestCachePolicy = .returnCacheDataElseLoad
            let session = URLSession(configuration: config)
            let task = session.dataTask(with: url) { data, response, error in
                if let err = error {
                    print(" Error fetching image from : \(url)")
                }
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
                
            }
            task.resume()
        }
    }
}
