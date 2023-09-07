//
//  RootUseCases.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 06.09.2023.
//

import RxSwift

public protocol RootUseCases {
    func getTracksForArtist(artistName: String?) -> Single<ItunesModel<Track>>
}


