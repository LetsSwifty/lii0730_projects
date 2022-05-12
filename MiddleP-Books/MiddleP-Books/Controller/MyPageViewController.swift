//
//  MyPageViewController.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/01.
//

import Foundation
import UIKit
import SnapKit

protocol MyPageVCDelegate {
    func Deleted(book: Book)
}

class MyPageViewController: UIViewController {
    
    var bookList: [Book] = []
    
    var delegate: MyPageVCDelegate?
    
    lazy var emptyTextLabel: UILabel = {
        let label = UILabel()
        label.text = "도서 목록이 비어있습니다."
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        
        return tableView
    }()
    
    func layoutSubView() {
        [emptyTextLabel, tableView].forEach {
            view.addSubview($0)
        }
        
        emptyTextLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if bookList.isEmpty {
            self.emptyTextLabel.isHidden = false
            self.tableView.isHidden = true
        } else {
            self.emptyTextLabel.isHidden = true
            self.tableView.isHidden = false
        }
        
        layoutSubView()
        
        tableView.register(SelectedBookCell.self, forCellReuseIdentifier: "SelectedBookCell")
        tableView.rowHeight = 120
        
    }
}

extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedBookCell") as? SelectedBookCell else {
            return UITableViewCell()
        }
        
        let book = self.bookList[indexPath.row]
        cell.titleLabel.text = book.title
        cell.bookImageView.image = ImageLoader.Load(url: book.image)
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(OnClick(_:)), for: .touchUpInside)
        
        return cell
    }
}

extension MyPageViewController {
    @objc func OnClick(_ sender: UIButton) {
        let alert = UIAlertController(title: "알림", message: "삭제하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            guard let self = self else { return }
            var deletedBook = self.bookList.remove(at: sender.tag)
            deletedBook.IsGood = false

            self.delegate?.Deleted(book: deletedBook)
            self.tableView.reloadData()

            if(self.bookList.count == 0) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(okAction)
        alert.addAction(cancel)

        self.present(alert, animated: true)
        
    }
}
