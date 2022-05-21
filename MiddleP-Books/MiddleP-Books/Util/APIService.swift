//
//  APIService.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/09.
//

import Foundation

class APIService {
    
    static let NAVER_CLIENT_ID: String = Bundle.main.client_id
    static let NAVER_CLIETN_SECRET: String = Bundle.main.client_secret
    
    static func makeAPIRequest(keyword: String) -> URLRequest {
        let EncodedKeyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let urlString = "https://openapi.naver.com/v1/search/book.json?query=\(EncodedKeyword)"
        
        let url = URL(string: urlString)
        
        var request: URLRequest = URLRequest(url: url!)
        request.addValue(NAVER_CLIENT_ID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(NAVER_CLIETN_SECRET, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        return request
    }
}
