//
//  Extensions+Bundle.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/21.
//

import Foundation


extension Bundle {
    var client_id: String {
        guard let naverPlist = self.path(forResource: "Naver", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: naverPlist) else { return "" }
        guard let id = resource["client_id"] as? String else { fatalError("Naver.pList파일에 CLIENT_ID 값을 입력하세요!") }
        return id
    }
    
    var client_secret: String {
        guard let naverPlist = self.path(forResource: "Naver", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: naverPlist) else { return "" }
        guard let secret = resource["client_secret"] as? String else { fatalError("Naver.pList파일에 CLIENT_SECRET 값을 입력하세요!") }
        return secret
    }
}
