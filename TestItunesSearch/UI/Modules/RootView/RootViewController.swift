//
//  RootViewController.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 06.09.2023.
//

import UIKit
import RxSwift
import RxCocoa

final class RootViewController: BaseViewController {
    
    private var artistName: String = ""
    
    var viewModel: RootViewModel!
    
    private let searchText = BehaviorSubject<String>(value: "https://itunes.apple.com/search?term=drake&entity=album")
    
    private var disposeBag = DisposeBag()
    
    private var albumsModel: ItunesModel<Album>?
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func bindViewModel() {
        let input = RootViewModel.Input(artisName: searchText.asObservable())
        
        let output = viewModel.transform(input: input)
        
        output.itunesModel
            .drive(onNext: { [weak self] albums in
                guard let self = self else { return }
                self.albumsModel = albums
                self.collectionView.reloadData()
            }).disposed(by: disposeBag)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.changeText()
        }
    }
    
    private func changeText() {
        searchText.onNext("https://itunes.apple.com/search?term=Pop+Smoke&entity=album")
    }
}

extension RootViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumsModel?.resultCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
    }
}

extension RootViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RootCollectionViewCell
        guard let viewModelCell = albumsModel?.results[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.updateViewModel(viewModelCell)
        
        return cell
    }
}
