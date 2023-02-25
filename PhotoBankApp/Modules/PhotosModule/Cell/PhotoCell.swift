//
//  PhotoCell.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let reusedID = K.photoCellReusedID
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemYellow
        //viewHeirarchy()
        //applyConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
