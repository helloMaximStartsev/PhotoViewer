//
//  PhotoModel.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 07.09.2023.
//

import Foundation

struct Response: Decodable {
    let totalPhotos: Int
    let photos: [PhotoModel]
    
    enum CodingKeys: String, CodingKey {
        case totalPhotos = "total_photos"
        case photos
    }
}

struct PhotoModel: Decodable {
    let url: String
}
