//
//  ImageLoader.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/08.
//

import UIKit

class ImageLoader {
    static func load(url: String, completion: @escaping (UIImage) -> Void) {
        let imageURL = URL(string: url)!
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            guard let imageData = data else { return }
            guard let image = UIImage(data: imageData) else { return }
            completion(image)
        }
        .resume()
    }
}
