//
//  ItunesModel.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 06.09.2023.
//

import Foundation

public protocol ItunesModelProtocol {
    
}

public struct ItunesModel<T: ItunesModelProtocol & Codable>: Codable {
    let resultCount: Int
    var results: [T]
}

public struct AudioBook: Codable, ItunesModelProtocol {
    let wrapperType: String
    let artistId: Int
    let collectionId: Int
    let artistName: String
    let collectionName: String
    let collectionCensoredName: String
    let collectionViewUrl: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double
    let collectionExplicitness: String
    let trackCount: String
    let copyright: String
    let country: String
    let currency: String
    let releaseDate: String
    let primaryGenreName: String
}

public struct Track: Codable, ItunesModelProtocol {
    let wrapperType: String
    let kind: String
    let artistId: Int
    let collectionId: Int
    let trackId: Int
    let artistName: String
    let collectionName: String
    let trackName: String
    let collectionCensoredName: String
    let trackCensoredName: String
    let artistViewUrl: String
    let collectionViewUrl: String
    let trackViewUrl: String
    let previewUrl: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double
    let trackPrice: Double
    let releaseDate: String
    let collectionExplicitness: String
    let trackExplicitness: String
    let discCount: Int
    let discNumber: Int
    let trackCount: Int
    let trackNumber: Int
    let trackTimeMillis: Int
    let country: String
    let currency: String
    let primaryGenreName: String
    let contentAdvisoryRating: String
    let isStreamable: Bool
}


public struct Album: Codable, ItunesModelProtocol {
    let collectionName: String
    let artworkUrl100: String
    let collectionId: Int
    let artistName: String
    let primaryGenreName: String
}
