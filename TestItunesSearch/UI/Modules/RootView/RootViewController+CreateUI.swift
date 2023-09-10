//
//  RootViewController+CreateUI.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 07.09.2023.
//

import UIKit
import SnapKit
import CustomUI

extension RootViewController: ViewPresentable {
    func createUI() {
        createCollectionView()
    }
    
    private func createCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RootCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = CustomColors.backgroundColor
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
