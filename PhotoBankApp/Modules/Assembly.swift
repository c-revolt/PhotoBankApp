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
        let networkDataFetcher = NetworkDataFetcher()
        let viewModel = PhotosViewModel(view: view, networkDataFetcher: networkDataFetcher, coordinator: coordinator)
        viewModel.view = view
        
        return view
    }
}
