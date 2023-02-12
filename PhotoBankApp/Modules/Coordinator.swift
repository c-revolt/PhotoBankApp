//
//  Coordinator.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import UIKit

final class Coordinator {
    
    private let assembly: Assembly
    private let tabBarController = UITabBarController()
    
    init(assembly: Assembly) {
        self.assembly = assembly
    }
    
    func start(window: UIWindow) {
        tabBarController.setViewControllers(
            [
                UINavigationController(rootViewController: assembly.makePhotos(output: self)),
                UINavigationController(rootViewController: UIViewController())
            ],
            animated: true
        )
        
        setupTabBarController()
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .dark
    }
    
    private func setupTabBarController() {
        
        tabBarController.viewControllers?[0].tabBarItem = UITabBarItem(
            title: "Photos",
            image: UIImage(systemName: "photo.on.rectangle"),
            tag: 0)
        
        tabBarController.viewControllers?[1].tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(systemName: "heart"),
            tag: 1)
    }
}

extension Coordinator: PhotosOutput {
    
}
