//
//  PhotosViewController.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import UIKit

protocol PhotosViewControllerProtocol: AnyObject {
    
}

class PhotosViewController: UIViewController {

    // properties
    let viewModel: PhotosViewModelProtocol?
    private let dataProvider: PhotosDataProvider?
    private var collectionView: UICollectionView?
    
    
    // lifecircle
    init(viewModel: PhotosViewModelProtocol?) {
        
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Photos"
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        collectionView?.frame = view.bounds
    }
    
    // methods
    private func setupCollectionView() {
        
        
    }
    


}

extension PhotosViewController: PhotosViewControllerProtocol {
    
}
