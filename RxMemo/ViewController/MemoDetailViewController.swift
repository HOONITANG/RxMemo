//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType {
    
    // MARK: Properties
    var viewModel: MemoDetailViewModel!
    var listTableView = UITableView()
    var deleteButton: UIBarButtonItem = { return UIBarButtonItem(barButtonSystemItem: .trash, target: MemoDetailViewController.self, action: nil) }()
    var editButton: UIBarButtonItem = { return UIBarButtonItem(barButtonSystemItem: .compose, target: MemoDetailViewController.self, action: nil) }()
    var shareButton: UIBarButtonItem = { return UIBarButtonItem(barButtonSystemItem: .action, target: MemoDetailViewController.self, action: nil) }()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        toolbarConfigure()
        tableViewConfigure()
        
        view.addSubview(listTableView)
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        listTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        // Do any additional setup after loading the view.
    }
    
    // MARK: Helpers
    func toolbarConfigure() {
        self.navigationController?.isToolbarHidden = false
        
        var items = [UIBarButtonItem]()
        
        items.append( deleteButton )
        items.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        items.append( editButton )
        items.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        items.append( shareButton )
        
        self.toolbarItems = items // this made the difference. setting the items to the controller, not the navigationcontroller
    }
    
    func tableViewConfigure(){
        listTableView.allowsSelection = false
        listTableView.separatorStyle = .none
        
        listTableView.register(MemoContentTableViewCell.self, forCellReuseIdentifier: String(describing: MemoContentTableViewCell.self))
        listTableView.register(MemoDateTableViewCell.self, forCellReuseIdentifier: String(describing: MemoDateTableViewCell.self))
        
    }
    
    func bindViewModel() {
        
    }
}
