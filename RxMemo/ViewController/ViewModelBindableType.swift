//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import UIKit

protocol ViewModelBindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}


// viewcontroller ViewModel 속성에 ViewModel을 저장
// bindViewModel 메서드를 자동으로 구현하는 메서드를 구현
extension ViewModelBindableType where Self: UIViewController {
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
