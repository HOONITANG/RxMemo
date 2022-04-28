//
//  Scene.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

// 스토리보드를 생성하고, 연관되는 ViewModel을 바인딩해서
// 리턴하는 작업을 함.
extension Scene {
    func instantiate(from controller: UIViewController = MemoListViewController()) -> UIViewController {
        switch self {
            
        case .list(let viewModel):
            guard let nav = controller as? UINavigationController else {
                fatalError()
            }
            guard var listVC = nav.viewControllers.first as? MemoListViewController else {
                fatalError()
            }
            
            listVC.bind(viewModel: viewModel)
            
            return nav
        case .detail(let viewModel):
            guard var detailVC = controller as? MemoDetailViewController else {
                fatalError()
            }
            
            detailVC.bind(viewModel: viewModel)
            return detailVC
            
        case .compose(let viewModel):
            guard let nav = controller as? UINavigationController else {
                fatalError()
            }
            guard var composeVC = nav.viewControllers.first as? MemoComposeViewController else {
                fatalError()
            }
            
            composeVC.bind(viewModel: viewModel)
            return nav
        }
    }
}
