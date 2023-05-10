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
    private var dataProvider: PhotosDataProvider?
    private var collectionView: UICollectionView?
    
    
    // lifecircle
    init(viewModel: PhotosViewModelProtocol? = nil) {
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
        
        dataProvider = PhotosDataProvider()
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = dataProvider
        collectionView.delegate = dataProvider
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reusedID)
        
    }
    
    private func getComposotionalLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1/3)
            )
        )
        
        let firstItemOfFirstGroup = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/2),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let firstGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            ),
            subitems: [firstItemOfFirstGroup]
        )
    
        let firstItemOfSecondGroup = NSCollectionLayoutGroup(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        let secondGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1/3)
            ),
            subitems: [firstItemOfSecondGroup]
        )
        
        let containerGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(600)),
            subitems: [item, firstGroup, secondGroup]
        )
        
        let section = NSCollectionLayoutSection(group: containerGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }


}

extension PhotosViewController: PhotosViewControllerProtocol {
    
}
