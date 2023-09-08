//
//  PhotoBrowseViewController.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 08.09.2023.
//

import UIKit

final class PhotoBrowseViewController: UIViewController {
    
    private let viewModel: PhotoBrowseViewModel
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cat")
        return imageView
    }()
    
    init(viewModel: PhotoBrowseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        bindImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubviews()
        viewModel.getImage()
    }
    
}

private extension PhotoBrowseViewController {
    
    func setupView() {
        title = "PhotoBrowse"
        view.backgroundColor = .white
    }
    
    func setupSubviews() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func bindImage() {
        viewModel.image.bind { photo in
            DispatchQueue.main.async {
                self.imageView.image = photo
            }
        }
    }
}
