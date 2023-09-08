//
//  PhotoBrowseViewModel.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 08.09.2023.
//

import UIKit

final class PhotoBrowseViewModel {
    
    private let networkService = NetworkService.shared
    private let urlString: String
    var image: Observable<UIImage> = Observable(value: UIImage())
        
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func getImage() {
        networkService.getImage(urlString: urlString) { [unowned self] image in
            self.image.value = image
        }
    }

}
