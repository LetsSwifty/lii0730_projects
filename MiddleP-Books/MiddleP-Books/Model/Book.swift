//
//  Book.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/01.
//

import Foundation
import UIKit


struct Books: Codable {
    var items: [Book]
}

struct Book: Codable {
    let title: String
    let description: String
    let image: String
    
    var _isGood: Bool?
    var IsGood: Bool {
        get {
            if _isGood == nil {
                return false
            } else {
                return _isGood!
            }
        }
        
        set {
            _isGood = newValue
        }
    }
}
