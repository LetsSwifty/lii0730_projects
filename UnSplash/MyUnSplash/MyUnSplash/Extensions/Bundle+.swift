//
//  Bundle+.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/08.
//

import Foundation


extension Bundle {
    var client_id: String {
        guard let splashPlist = self.path(forResource: "Splash", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: splashPlist) else { return "" }
        guard let id = resource["client_id"] as? String else { fatalError("Splash.pList파일에 CLIENT_ID 값을 입력하세요!") }
        return id
    }
}
