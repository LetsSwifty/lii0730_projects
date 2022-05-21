//
//  BookCell.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/01.
//

import Foundation
import UIKit

protocol BookCellDelegate {
    func Select(book: Book, row: Int)
}

class BookCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    var item: Book?
    var row: Int?
    var delegate: BookCellDelegate?
    
    func setBook(for book: Book) {
        self.titleLabel.text = book.title
        self.descLabel.text = book.description
        self.bookImage.image = ImageLoader.load(url: book.image)
        
        //MARK: - reload될때 Cell을 재사용하면서 체크 표시가 엉뚱하게 표시되는 이슈
        // tableView가 reload될때 올바르게 표시되기 위한 조치
        self.starButton.setImage(self.item!.isGood ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
    }
    
    @IBAction func onSelect(_ sender: UIButton) {
        self.item?.isGood.toggle()
        self.starButton.setImage(self.item!.isGood ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"), for: .normal)
        
        if let item = self.item, let row = self.row {
            delegate?.Select(book: item, row: row)
        }
    }
}
