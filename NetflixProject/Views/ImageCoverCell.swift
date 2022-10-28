//
//  ImageCoverCell.swift
//  NetflixProject
//
//  Created by Ivan Valero on 23/09/2022.
//

import UIKit
import Kingfisher

class ImageCoverCell: UICollectionViewCell {
    
    static let kId = "ImageCoverCell"
    
    private let imageCover: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageCover)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageCover.frame = contentView.bounds
    }
    
    public func configImageCover(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else { return }
        imageCover.kf.setImage(with: url)
    }
    
}
