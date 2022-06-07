//
//  ImageResponse.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/08.
//

import Foundation


struct ImageResponse: Codable {
    let urls: ImageURL
}

struct ImageURL: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
    let small_s3: String
}
