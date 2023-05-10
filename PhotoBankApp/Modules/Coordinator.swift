//
//  Coordinator.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import UIKit


protocol MainCoordinatorProtocol: AnyObject {
    var tabBarController: UITabBarController? { get set }
    var assembly: AssemblyProtocol? { get set }
}

protocol CoordinatorProtocol: MainCoordinatorProtocol {
    func start(window: UIWindow)
}

final class AppCoordinator: CoordinatorProtocol {
    
    var tabBarController: UITabBarController?
    var assembly: AssemblyProtocol?
    
    init(tabBarController: UITabBarController, assembly: AssemblyProtocol) {
        self.tabBarController = tabBarController
        self.assembly = assembly
    }
    
    func start(window: UIWindow) {
        if let tabBarController = tabBarController {
            guard let photosViewController = assembly?.makePhotosModule(coordinator: self) else { return }
            tabBarController.setViewControllers(
                [
                    UINavigationController(rootViewController: photosViewController),
                    UINavigationController(rootViewController: UIViewController())
                ],
                animated: true
            )
        }
        
        setupTabBarController()
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .dark
    }
    
    private func setupTabBarController() {
        
        tabBarController?.viewControllers?[0].tabBarItem = UITabBarItem(
            title: "Photos",
            image: UIImage(systemName: "film"),
            tag: 0)
        
        tabBarController?.viewControllers?[1].tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(systemName: "heart"),
            tag: 1)
        
        tabBarController?.tabBar.tintColor = .systemGreen
    }
    
}
