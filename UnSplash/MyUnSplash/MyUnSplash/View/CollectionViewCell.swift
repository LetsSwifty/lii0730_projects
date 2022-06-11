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
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var loadingView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(imageView)
        contentView.addSubview(loadingView)
        
        imageView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(contentView)
        }
        
        loadingView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(contentView)
        }
    }
}
