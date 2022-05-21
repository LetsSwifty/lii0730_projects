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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupSearchController()
    }
    
    // 검색창 설정
    private func setupSearchController() {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "책 제목을 입력하세요."
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        
        self.navigationItem.searchController = searchController
        
    }
    
    // 책 제목으로 검색 API 호출
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
    
    // 마이페이지로 이동
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
    // 키워드를 입력하고 Enter or 검색 버튼을 눌렀을 때 호출
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        guard let title = searchBar.text else { return false }
        fetchData(title: title)
        return true
    }
}

//MARK: - DeleteDelegate
extension BookListViewController: MyPageVCDelegate {
    // 마이페이지 책 목록이 삭제 되었을 떄 호출
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
    // star 버튼 클릭했을떄 호출
    func Select(book: Book, row: Int) {
        self.bookList[row] = book // 덮어쓰기
    }
}

