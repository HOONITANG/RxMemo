//
//  MemoComposeViewModel.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import Foundation
import RxSwift
import RxCocoa
import Action


// 새로운 메모를 추가할 때, 메모를 편집 할 때 사용되는 ViewModel
class MemoComposeViewModel: CommonViewModel {
    private let content: String?
    
    var initialText: Driver<String?> {
        return Observable.just(content).asDriver(onErrorJustReturn: nil)
    }
    
    // 저장, 취소
    let saveAction: Action<String, Void>
    let cancelAction: CocoaAction
    
    // viewModel에서 action을 구현하면 하나로 정해지지만,
    // 파라미터로 받으면 광범위하게 사용 할 수있어 파라미터로 받음
    init(title: String, content: String? = nil, sceneCoordinator: SceneCoordinatorType,
         storage: MemoryStorage, saveAction: Action<String, Void>? = nil, cancelAction: CocoaAction? = nil) {
        self.content = content
        self.saveAction = Action<String, Void> { input in
            if let action = saveAction {
                action.execute(input)
            }
            // 액션이 전달되지 않았다면 화면만 닫음.
            return sceneCoordinator.close(animated: true).asObservable().map { _ in }
        }
        
        self.cancelAction = CocoaAction {
            if let action = cancelAction {
                action.execute(())
            }
            return sceneCoordinator.close(animated: true).asObservable().map{ _ in}
        }
        
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
    }
}
