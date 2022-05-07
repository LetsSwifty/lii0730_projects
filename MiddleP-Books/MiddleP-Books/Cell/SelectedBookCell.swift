//
//  SelectedBookCell.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/02.
//

import Foundation
import UIKit

class SelectedBookCell: UITableViewCell {
    
    lazy var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Test Label"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.bin.circle"), for: .normal)
        button.tintColor = UIColor.red
        
        // 버튼의 이미지 크기 변경
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 15)
        var config = UIButton.Configuration.plain()
        config.preferredSymbolConfigurationForImage = imageConfig
        
        button.configuration = config
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [bookImageView, titleLabel, deleteButton].forEach {
            contentView.addSubview($0)
        }
        
        bookImageView.snp.makeConstraints {
            $0.size.width.equalTo(100)
            $0.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(titleLabel.snp.leading)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(bookImageView.snp.trailing)
            $0.top.equalTo(bookImageView.snp.top).offset(10)
            $0.width.equalTo(200)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
        }
        
        selectionStyle = .none
    }
}
