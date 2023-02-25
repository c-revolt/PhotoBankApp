//
//  Assembly.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import UIKit

protocol AssemblyProtocol: AnyObject {
 
    func makePhotosModule(coordinator: CoordinatorProtocol) -> UIViewController
}

final class Assembly: AssemblyProtocol {
    
    func makePhotosModule(coordinator: CoordinatorProtocol) -> UIViewController {
        let view = PhotosViewController()
        let networkService = NetworkService()
        let viewModel = PhotosViewModel(view: view, networkService: networkService, coordinator: coordinator)
        viewModel.view = view
        
        return view
    }
}
