//
//  APIService.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/08.
//

import UIKit

class APIService {
    static let GET_URL: String = "https://api.unsplash.com/photos"
    static let ACCESS_KEY: String = Bundle.main.client_id
    static var Image: [ImageResponse] = []
    
    static func GET_IMAGE() {
        var urlRequest: URLRequest = URLRequest(url: URL(string: APIService.GET_URL)!)
        urlRequest.setValue("Client-ID \(APIService.ACCESS_KEY)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            
            guard let imageData = try? JSONDecoder().decode([ImageResponse].self, from: data) else { return }
            APIService.Image = imageData
//            NSLog("Response:", imageData![0].urls.full)
        }
        .resume()
    
    }
}
