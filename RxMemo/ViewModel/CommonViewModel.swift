//
//  CommonViewModel.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel: NSObject {
    // navigation Item에 쉽게 바인딩 하기위해 사용
    let title: Driver<String>
    let sceneCoordinator: SceneCoordinatorType
    let storage: MemoStorageType
    
    init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}
