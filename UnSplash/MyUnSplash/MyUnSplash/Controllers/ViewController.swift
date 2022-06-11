//
//  ViewController.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var current_Page = 1
    private let total_Page = 10
    private var ImageList: [ImageResponse] = []
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // 컬렉션뷰의 스크롤 방향 설정
        layout.itemSize = CGSize(width: view.frame.size.width / 3, height: view.frame.size.width / 3)
        layout.minimumInteritemSpacing = 0.0
        
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetView()
        SetImage(currentPage: self.current_Page)
    }
    
    private func SetView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func SetImage(currentPage: Int) {
        APIService.GET_IMAGE(page: currentPage) { [weak self] imageList in
            print("Current Page:: \(currentPage)")
            guard let self = self else { return }
            DispatchQueue.main.async {
                if imageList.count > 0 {
                    self.ImageList.insert(contentsOf: imageList, at: self.ImageList.count)
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        let imageUrl: String = self.ImageList[indexPath.item].urls.regular
        
        DispatchQueue.main.async {
            ImageLoader.load(url: imageUrl) { loadImage in
                cell.imageView.image = loadImage
            }
            cell.loadingView.stopAnimating()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ImageList.count
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // 페이징 처리
        if self.current_Page < self.total_Page && indexPath.item == self.ImageList.count - 1 {
            self.current_Page = self.current_Page + 1
            self.SetImage(currentPage: self.current_Page)
        }
    }
}
