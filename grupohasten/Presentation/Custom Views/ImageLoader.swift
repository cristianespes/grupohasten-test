//
//  ImageLoader.swift
//  grupohasten
//
//  Created by Cristian Espes on 25/01/2020.
//  Copyright © 2020 Cristian Espes. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: UIImageView {

    var imageURL: URL?

    let activityIndicator = UIActivityIndicatorView()

    func loadImageWithUrl(_ url: URL, completion: ((Bool)->Void)? = nil) {

        activityIndicator.color = .darkGray

        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        imageURL = url

        image = nil
        activityIndicator.startAnimating()

        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {

            self.image = imageFromCache
            activityIndicator.stopAnimating()
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if let error = error {
                print(error as Any)
                DispatchQueue.main.async  {
                    self.activityIndicator.stopAnimating()
                    completion?(false)
                }
                return
            }

            DispatchQueue.main.async {
                
                guard let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) else {
                    self.activityIndicator.stopAnimating()
                    completion?(false)
                    return
                }

                if self.imageURL == url {
                    self.image = imageToCache
                }

                imageCache.setObject(imageToCache, forKey: url as AnyObject)
                self.activityIndicator.stopAnimating()
                completion?(true)
            }
        }).resume()
    }
}
