//
//  PhotosViewModel.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import Foundation

protocol PhotosViewModelProtocol: AnyObject {
    
}

final class PhotosViewModel {
    
    weak var view: PhotosViewControllerProtocol?
    private weak var output: PhotosOutput?
    
    init(view: PhotosViewControllerProtocol? = nil, output: PhotosOutput? = nil) {
        self.view = view
        self.output = output
    }
    
    
    
}

extension PhotosViewModel: PhotosViewModelProtocol {
    
}
