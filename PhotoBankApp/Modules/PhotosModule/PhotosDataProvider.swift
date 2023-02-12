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
    var photosDataProvider = PhotosViewModel()
}

extension PhotosDataProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    
}
