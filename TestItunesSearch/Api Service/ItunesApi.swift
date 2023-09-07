//
//  ItunesApi.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 06.09.2023.
//

import Foundation

final class ItunesApi {}

extension URLRequest {
    mutating func configure(_ method: HttpMethod) {
        self.httpMethod = method.rawValue
    }
}

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
}
