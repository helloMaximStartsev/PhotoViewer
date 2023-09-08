//
//  PhotoBrowseCoordinator.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 08.09.2023.
//

import UIKit

final class PhotoBrowseCoordinator: Coordinator {

    // MARK: - Private Properties

    private let navigationController: UINavigationController
    private let urlString: String
    private var childCoordinators = [Coordinator]()

    // MARK: - Initializers

    init(navigationController: UINavigationController, urlString: String) {
        self.navigationController = navigationController
        self.urlString = urlString
    }

    // MARK: - Methods

    func start() {
        let viewModel = PhotoBrowseViewModel(urlString: urlString)
        let viewController = PhotoBrowseViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
