//
//  RootViewController+CreateUI.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 07.09.2023.
//

import UIKit
import PinLayout

extension RootViewController: ViewPresentable {
    func createUI() {
        createTableView()
    }
    
    private func createTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
