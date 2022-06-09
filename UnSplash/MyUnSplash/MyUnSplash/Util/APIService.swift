//
//  APIService.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/08.
//

import UIKit

class APIService {
    static let per_page: Int = 30
    static let GET_URL: String = "https://api.unsplash.com/photos"
    static let CLIENT_ID: String = Bundle.main.client_id
    
    static func GET_IMAGE(page: Int, completion: @escaping([ImageResponse]) -> Void) {
        var urlComponents: URLComponents = URLComponents(string: APIService.GET_URL)!
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "per_page", value: "\(APIService.per_page)")
        ]

        var urlRequest: URLRequest = URLRequest(url: urlComponents.url!)
        urlRequest.setValue("Client-ID \(APIService.CLIENT_ID)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            
            guard let imageData = try? JSONDecoder().decode([ImageResponse].self, from: data) else { return }
            completion(imageData)
        }
        .resume()
    
    }
}
