//
//  CollectionViewCell.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/09.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
        
        imageView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(contentView)
        }
    }
}
