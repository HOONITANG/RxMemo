//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import Foundation
import RxSwift
import RxCocoa
import Action

// 화면전환과 메모저장을 모두 처리함
// 위의 작업을 위해, SceneCoordinator와 MemoStorage을 사용함
// 생성자에서 의존성을 주입해줘야함.
class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
    
    // 저장이 곧, 생성된 Observable의 데이터를 업데이트 하는것임.
    func performUpdate(memo: Memo) -> Action<String, Void> {
        return Action { input in
            return self.storage.update(memo: memo, content: input).map { _ in } // map연산자로 void로 만들어버림.
        }
    }
    
    // makeCreatAction을 통해, 생성된 Observable를 삭제함.
    func performCancel(memo: Memo) -> CocoaAction {
        return Action {
            return self.storage.delete(memo: memo).map { _ in }
        }
    }
    
    func makeCreateAction() -> CocoaAction {
        return CocoaAction { _ in
            return self.storage.createMemo(content: "")
                .flatMap { memo -> Observable<Void> in
                    let composeViewModel = MemoComposeViewModel(title: "새 메모", sceneCoordinator: self.sceneCoordinator, storage: self.storage as! MemoryStorage, saveAction: self.performUpdate(memo: memo), cancelAction: self.performCancel(memo: memo))
                    
                    let composeScene = Scene.compose(composeViewModel)
                    return self.sceneCoordinator.transition(to: composeScene, using: .modal, animated: true).asObservable().map { _ in }
                }
        }
    }
}
