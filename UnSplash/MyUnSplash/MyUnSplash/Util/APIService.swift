//
//  APIService.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/08.
//

import UIKit

class APIService {
    static var page: Int = 1
    static let GET_URL: String = "https://api.unsplash.com/photos?page=\(page)"
    static let CLIENT_ID: String = Bundle.main.client_id
    
    static func GET_IMAGE(completion: @escaping([ImageResponse]) -> Void) {
        var urlRequest: URLRequest = URLRequest(url: URL(string: APIService.GET_URL)!)
        urlRequest.setValue("Client-ID \(APIService.CLIENT_ID)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            
            guard let imageData = try? JSONDecoder().decode([ImageResponse].self, from: data) else { return }
            completion(imageData)
            page = page + 1
        }
        .resume()
    
    }
}
