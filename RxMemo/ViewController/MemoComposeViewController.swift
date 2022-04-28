//
//  MemoComposeViewController.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import UIKit
import RxSwift

class MemoComposeViewController: UIViewController, ViewModelBindableType {
    
    // MARK: Properties
    var viewModel: MemoComposeViewModel!
    
    var cancelButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Cancel", style: .plain, target: MemoComposeViewController.self, action: nil)
        return button
    }()
    var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Save", style: .plain, target: MemoComposeViewController.self, action: nil)
        return button
    }()
    
    var contentTextView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationConfigure()
        
        view.addSubview(contentTextView)
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        contentTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    // 화면이 나올 때
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TextView 입력 활성화
        contentTextView.becomeFirstResponder()
    }
    
    // 화면이 사라질 때
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 활성화 해제
        if contentTextView.isFirstResponder {
            contentTextView.resignFirstResponder()
        }
    }
    
    
    // MARK: Helpers
    
    @objc func cancelButtonDidTapped() {
        
    }
    
    @objc func saveButtonDidTapped() {
        
    }
    
    func navigationConfigure() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        // 쓰기에는 빈문자열, 편집모드에서는 편집될 메모가 표시됨
        viewModel.initialText
            .drive(contentTextView.rx.text)
            .disposed(by: rx.disposeBag)
        
        // cancelButton을 탭하면 viewModel의 cancelAction이 실행됨.
        cancelButton.rx.action = viewModel.cancelAction
        
        // 버튼을 탭 했을때, 메모를 저장 해야해서 cancel과 다른 구현이 필요함.
        saveButton.rx.tap
            .throttle(.microseconds(500), scheduler: MainScheduler.instance) // 더블 탭을 막기 위해, 0.5초마다 실행
            .withLatestFrom(contentTextView.rx.text.orEmpty)
            .bind(to: viewModel.saveAction.inputs)
            .disposed(by: rx.disposeBag)
    }
    
}
