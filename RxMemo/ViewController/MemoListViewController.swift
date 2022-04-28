//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    // MARK: Properties
    var viewModel: MemoListViewModel!
    
    lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        button.tintColor = .systemBlue
        return button
    }()
    
    var listTableView = UITableView()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationConfigure()
        tableConfigure()
        view.addSubview(listTableView)
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        listTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    // MARK: Helpers
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.memoList
            .bind(to: listTableView.rx.items(cellIdentifier: "cell")) { row, memo, cell in
                cell.textLabel?.text = memo.content
            }.disposed(by: rx.disposeBag)
        
        addButton.rx.action = viewModel.makeCreateAction()
    }
    
    func navigationConfigure() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = addButton
    }
    
    func tableConfigure() {
        listTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
