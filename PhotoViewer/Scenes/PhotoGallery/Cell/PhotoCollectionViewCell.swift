//
//  PhotoCollectionViewCell.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 07.09.2023.
//

import UIKit
import SnapKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    // MARK: - UI
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        activityIndicator.color = .darkGray
        return activityIndicator
    }()
        
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public functions
    
    func setCellImage(image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
            self.activityIndicator.stopAnimating()
        }
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        activityIndicator.startAnimating()
    }

}

// MARK: - Private functions

private extension PhotoCollectionViewCell {
    
    func setupCell() {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
    }
    
    func setupSubviews() {
        addSubview(imageView)
        imageView.addSubview(activityIndicator)
    }
    
    func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
}
