//
//  ViewController.swift
//  MyUnSplash
//
//  Created by LeeHsss on 2022/06/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
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
        SetImage()
    }
    
    private func SetView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func SetImage() {
        APIService.GET_IMAGE { [weak self] imageList in
            guard let self = self else { return }
            self.ImageList = imageList
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let imageUrl: String = self.ImageList[indexPath.item].urls.regular
        cell.imageView.image = ImageLoader.load(url: imageUrl)
        
        cell.contentView.backgroundColor = .systemBlue
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageList.count
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}

