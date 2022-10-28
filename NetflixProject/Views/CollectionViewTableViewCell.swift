//
//  CollectionViewTableViewCell.swift
//  NetflixProject
//
//  Created by Ivan Valero on 19/09/2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    
    static let kId = "CollectionViewTableViewCell"
    private var trendingModel: [TrendingAllDayModel.Result] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCoverCell.self, forCellWithReuseIdentifier: ImageCoverCell.kId)
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemTeal
        contentView.addSubview(collectionView)
        configCollectionView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    
    private func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configCollection(with trendingModel: TrendingAllDayModel.Result) {
        self.trendingModel = [trendingModel]
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
     }

}


extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCoverCell.kId, for: indexPath) as? ImageCoverCell else { return UICollectionViewCell() }
        cell.backgroundColor = .red
        cell.configImageCover(with: trendingModel[indexPath.row].posterPath ?? "title")
        return cell
    }
    
    
}
