//
//  PhotoGalleryCoordinator.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 07.09.2023.
//

import UIKit

final class PhotoGalleryCoordinator: Coordinator {

    // MARK: - Private Properties

    private let navigationController: UINavigationController
    private var childCoordinators = [Coordinator]()

    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func start() {
        let viewModel = PhotoGalleryViewModel(output: self)
        let viewController = PhotoGalleryViewController(viewModel: viewModel)
        
        navigationController.setViewControllers([viewController], animated: false)
    }
    
}

// MARK: - PhotoGalleryViewModelProtocol

extension PhotoGalleryCoordinator: PhotoGalleryViewModelProtocol {
    
    func didTapCell(urlString: String) {
        let photoBrowserCoordinator = PhotoBrowseCoordinator(navigationController: navigationController, urlString: urlString)
        photoBrowserCoordinator.start()
        childCoordinators.append(photoBrowserCoordinator)
    }
    
}
