//
//  Book.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/01.
//

import Foundation
import UIKit


struct Books: Decodable {
    var items: [Book]
}

struct Book: Decodable {
    let title: String
    let description: String
    let image: String
}
