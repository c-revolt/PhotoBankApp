//
//  Assembly.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import UIKit

final class Assembly {
    
    func makePhotos(output: PhotosOutput) -> UIViewController {
        let viewModel = PhotosViewModel(output: output)
        let view = PhotosViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view
    }
}
