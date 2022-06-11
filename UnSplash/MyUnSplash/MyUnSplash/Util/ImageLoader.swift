//
//  ImageLoader.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/08.
//

import UIKit

class ImageLoader {
    static func load(url: String, completion: @escaping (UIImage) -> Void) {
        let imageURL = URL(string: url)
        
        guard let imageData = try? Data(contentsOf: imageURL!) else { return }
        guard let image = UIImage(data: imageData) else { return }
        completion(image)
    }
}
