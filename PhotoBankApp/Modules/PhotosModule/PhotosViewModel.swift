//
//  PhotosViewModel.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import Foundation

protocol PhotosViewModelProtocol: AnyObject {
    init(view: PhotosViewControllerProtocol, networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol)
    var photos: [Photo]? { get set }
    func getData()
    
}

final class PhotosViewModel: PhotosViewModelProtocol {
    
    weak var view: PhotosViewControllerProtocol?
    var networkService: NetworkServiceProtocol?
    var coordinator: CoordinatorProtocol?
    var photos: [Photo]?
    
    init(view: PhotosViewControllerProtocol, networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol) {
        self.view = view
        self.networkService = networkService
        self.coordinator = coordinator
        
    }
    
    func getData() {
        
    }
    
    
    
}

