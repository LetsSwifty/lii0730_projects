//
//  ImageLoader.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/10.
//

import UIKit


class ImageLoader {
    static func load(url: String) -> UIImage {
        let imageURL = URL(string: url)
        
        guard let imageData = try? Data(contentsOf: imageURL!) else { return UIImage() }
        return UIImage(data: imageData)!
    }
}
