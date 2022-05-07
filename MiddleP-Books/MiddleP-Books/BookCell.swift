//
//  BookCell.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/01.
//

import Foundation
import UIKit

protocol SelectDelegate {
    func Select(book: Book, row: Int)
}

class BookCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    var item: Book?
    var row: Int?
    var delegate: SelectDelegate?
    
    func setBook() {
        
        guard let item = self.item else { return }
        
        self.titleLabel.text = item.title
        self.descLabel.text = item.description
        self.bookImage.image = UIImage(named: item.imageURL)
        self.starButton.setImage(item.isGood ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
    }
    
    @IBAction func onSelect(_ sender: UIButton) {
        if var item = self.item, let row = self.row {
            item.isGood.toggle()
            
            self.starButton.setImage(item.isGood ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
            
            delegate?.Select(book: item, row: row)
            
        }
    }
}
