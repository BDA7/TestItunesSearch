//
//  RootConfiguration.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 06.09.2023.
//

import Foundation

final class RootConfiguration {
    static func build() -> RootViewController {
        let viewController = RootViewController()
        viewController.viewModel = RootViewModel()
        
        return viewController
    }
}
