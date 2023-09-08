//
//  PhotoGalleryViewModel.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 07.09.2023.
//

import UIKit

protocol PhotoGalleryViewModelProtocol: AnyObject {
    func didTapCell(urlString: String)
}

final class PhotoGalleryViewModel {
    
    private weak var output: PhotoGalleryViewModelProtocol?
    private let networkService = NetworkService.shared
    var photos: Observable<[PhotoModel]> = Observable(value: [])
    private var offset = 0
    private let limit = 30
    private var totalPhotos: Int = 1
    
    init(output: PhotoGalleryViewModelProtocol) {
        self.output = output
        
        getPhotos()
    }
    
    func getPhotos() {
        guard offset < totalPhotos else { return }
        
        networkService.getPhotos(offset: offset, limit: limit) { [unowned self] response in
            self.totalPhotos = response.totalPhotos
            self.photos.value.append(contentsOf: response.photos)
        }
        
        offset += limit
    }
    
    func getImage(urlString: String, completion: @escaping (UIImage) -> Void) {
        networkService.getImage(urlString: urlString) { image in
            completion(image)
        }
    }
    
    func didTapCell(urlString: String) {
        output?.didTapCell(urlString: urlString)
    }
    
}
