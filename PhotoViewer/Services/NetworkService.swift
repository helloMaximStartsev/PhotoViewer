//
//  NetworkService.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 07.09.2023.
//

import UIKit

final class NetworkService {
    
    static let shared = NetworkService()
    private let imageCache = NSCache<AnyObject,AnyObject>()
    
    private init() {}
    
    func getPhotos(offset: Int, limit: Int, completion: @escaping (Response) -> Void) {
        let urlString = "https://api.slingacademy.com/v1/sample-data/photos?offset=\(offset)&limit=\(limit)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            } else {
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    completion(response)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: urlString) else { return }
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            completion(imageFromCache)
            return
        }
        
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            } else {
                guard let data = data,
                      let image = UIImage(data: data) else { return }

                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                completion(image)
            }
        }.resume()
//                }
        
    }
    
}
