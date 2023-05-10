//
//  PhotosDataProvider.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import UIKit

enum PhotosSection: Int, CaseIterable {
    case photos
}

final class PhotosDataProvider: NSObject {
    private weak var viewModel: PhotosViewModelProtocol?
}

extension PhotosDataProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//       guard let viewModel = viewModel else { fatalError() }
//        return viewModel.photos?.count ?? 0
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reusedID, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .randome
        
        return cell
    }
    
}

extension PhotosDataProvider: UICollectionViewDelegate {
    
}

extension UIColor {
    static var randome: UIColor {
        return UIColor(red: .random(in: 0.4...1),
                       green: .random(in: 0.4...1),
                       blue: .random(in: 0.4...1),
                       alpha: 1)
    }
}
