//
//  BaseViewController.swift
//  TestItunesSearch
//
//  Created by Данила Бондаренко on 07.09.2023.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if let presentable = self as? ViewPresentable {
            presentable.createUI()
        }
        bindUI()
        bindViewModel()
    }
    
    open func bindUI() {}
    open func bindViewModel() {}
}
