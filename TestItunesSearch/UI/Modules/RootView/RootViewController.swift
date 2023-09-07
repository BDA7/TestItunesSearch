//
//  RootViewController.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 06.09.2023.
//

import UIKit
import RxSwift
import RxCocoa

class RootViewController: BaseViewController {
    
    private var artistName: String = ""
    
    var viewModel: RootViewModel!
    
    private let searchText = BehaviorSubject<String>(value: "https://itunes.apple.com/search?term=drake&entity=album")
    
    private var disposeBag = DisposeBag()
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func bindViewModel() {
        let input = RootViewModel.Input(artisName: searchText.asObservable())
        
        let output = viewModel.transform(input: input)
        
        output.itunesModel
            .drive(onNext: { albums in
                print(albums)
            }).disposed(by: disposeBag)
        
        changeText()
    }
    
    private func changeText() {
        searchText.onNext("https://itunes.apple.com/search?term=Pop+Smoke&entity=album")
    }
}

extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

extension RootViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}
