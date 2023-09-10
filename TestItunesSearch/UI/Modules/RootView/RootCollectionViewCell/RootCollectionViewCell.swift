//
//  RootCollectionViewCell.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 07.09.2023.
//

import UIKit
import SnapKit
import Kingfisher
import CustomUI

final class RootCollectionViewCell: UICollectionViewCell {
    private let container = UIView()
    private let imageAlbum = UIImageView()
    private let nameAlbum = UILabel()
    
    private var viewModel: Album! {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateViewModel(_ viewModel: Album) {
        self.viewModel = viewModel
    }
    
    private func createUI() {
        contentView.addSubview(container)
        container.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        container.addSubview(imageAlbum)
        imageAlbum.layer.masksToBounds = true
        imageAlbum.layer.cornerRadius = 10.0
        imageAlbum.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-48)
        }
        
        nameAlbum.textColor = CustomColors.baseTintColor
        nameAlbum.font = CustomFonts.cellFont
        nameAlbum.numberOfLines = 2
        container.addSubview(nameAlbum)
        nameAlbum.snp.makeConstraints {
            $0.top.equalTo(imageAlbum.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    private func updateUI() {
        nameAlbum.text = viewModel.collectionName
        imageAlbum.kf.indicatorType = .activity
        imageAlbum.kf.setImage(with: URL(string: viewModel.artworkUrl100), placeholder: UIImage(named: ""), options: [.cacheOriginalImage])
    }
    
}
