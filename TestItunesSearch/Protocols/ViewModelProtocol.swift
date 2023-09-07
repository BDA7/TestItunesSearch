//
//  ViewModelProtocol.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 06.09.2023.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
