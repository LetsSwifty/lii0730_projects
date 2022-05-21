//
//  BookListViewController.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/01.
//

import Foundation
import UIKit

class BookListViewController: UITableViewController {
    var bookList: [Book] = []
    var likeBookList: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupSearchController()
    }
    
    private func setupSearchController() {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "책 제목을 입력하세요."
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        
        self.navigationItem.searchController = searchController
        
    }
    
    private func fetchData(title: String) {
        let request = APIService.makeAPIRequest(keyword: title)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            guard let data = data else { return }
            
            let successRange = 200..<300
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, successRange.contains(statusCode) else { return }
            
            guard let response = try? JSONDecoder().decode(Books.self, from: data) else { return }
            self.bookList = response.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
    
    @IBAction func Move(_ sender: Any) {
        guard let myPageVC = self.storyboard?.instantiateViewController(withIdentifier: "MyPage") as? MyPageViewController else { return }
        myPageVC.bookList = self.bookList.filter({ b in
            b.isGood == true
        })
        myPageVC.delegate = self
        self.navigationController?.pushViewController(myPageVC, animated: true)
    }
}

//MARK: - UISearchBarDelegate
extension BookListViewController: UISearchBarDelegate {
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        guard let title = searchBar.text else { return false }
        fetchData(title: title)
        return true
    }
}

//MARK: - DeleteDelegate
extension BookListViewController: MyPageVCDelegate {
    func Deleted(book: Book) {
        
        let index = self.bookList.firstIndex { b in
            b.title == book.title
        }

        guard let index = index else { return }
        self.bookList[index] = book
        self.tableView.reloadData()
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
        cell.delegate = self
        cell.row = indexPath.row
        cell.setBook(for: book)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookList.count
    }
}

//MARK: - 아이템 선택, 해제
extension BookListViewController: BookCellDelegate {
    func Select(book: Book, row: Int) {
        self.bookList[row] = book
    }
}

