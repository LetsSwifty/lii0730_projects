//
//  BookListViewController.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/01.
//

import Foundation
import UIKit


class BookListViewController: UITableViewController, DeleteDelegate {
    func Deleted(book: Book) {
        let index = self.bookList.firstIndex { b in
            b.title == book.title
        }
        
        guard let index = index else {
            return
        }

        self.bookList[index] = book
        self.tableView.reloadData()
    }
    
    
    var bookList: [Book] = Book.Dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func Move(_ sender: Any) {
        guard let myPageVC = self.storyboard?.instantiateViewController(withIdentifier: "MyPage") as? MyPageViewController else { return }
        myPageVC.bookList = self.bookList.filter({ book in
            book.isGood
        })
        
        myPageVC.delegate = self
        
        self.navigationController?.pushViewController(myPageVC, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension BookListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let book = bookList[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as? BookCell else {
            NSLog("cell 생성 오류")
            return UITableViewCell()
        }
        cell.item = book
        cell.row = indexPath.row
        cell.delegate = self
        cell.setBook()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookList.count
    }
}

//MARK: - 아이템 선택, 해제
extension BookListViewController: SelectDelegate {
    func Select(book: Book, row: Int) {
        self.bookList[row] = book
        self.tableView.reloadData()
    }
}

