//
//  AppCoordinator.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 07.09.2023.
//

import UIKit

// MARK: - Protocols

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {

    // MARK: - Private Properties

    private let window: UIWindow?
    private let navigationController = UINavigationController()
    private var childCoordinators = [Coordinator]()

    // MARK: - Initializers

    init(window: UIWindow?) {
        self.window = window
    }

    // MARK: - Methods

    func start() {
        let photoGalleryCoordinator = PhotoGalleryCoordinator(navigationController: navigationController)
        photoGalleryCoordinator.start()
        childCoordinators.append(photoGalleryCoordinator)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
