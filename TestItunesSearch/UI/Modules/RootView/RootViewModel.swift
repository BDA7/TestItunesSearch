//
//  RootViewModel.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 06.09.2023.
//

import Foundation
import RxSwift
import RxCocoa

final class RootViewModel: ViewModelProtocol {
    struct Input {
        var artisName: Observable<String>
    }
    
    struct Output {
        var itunesModel: Driver<ItunesModel<Album>>
    }
    
    func transform(input: Input) -> Output {
        let itunesModel = input.artisName
            .flatMap { (search) -> Observable<ItunesModel<Album>> in
                self.getData(artistName: search)
            }
            .asDriver(onErrorJustReturn: ItunesModel(resultCount: 0, results: []))
        return Output(itunesModel: itunesModel)
    }
    
    private func getData(artistName: String) -> Observable<ItunesModel<Album>> {
        guard let url = URL(string: artistName) else {
            return Observable.just(ItunesModel(resultCount: 0, results: []))
        }
        var request = URLRequest(url: url)
        request.configure(.get)
        
        let urlObserver = Observable<ItunesModel<Album>>.create { observer in
            let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    observer.onError(error)
                }
                
                if let data = data {
                    do {
                        let albums = try JSONDecoder().decode(ItunesModel<Album>.self, from: data)
                        observer.onNext(albums)
                        observer.onCompleted()
                    } catch {
                        observer.onError(error)
                    }
                }
                
            }
            
            dataTask.resume()
            
            return Disposables.create {
                dataTask.cancel()
            }
        }
        
        return urlObserver
    }
    
}
