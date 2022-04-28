//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import Foundation
import RxSwift
import RxCocoa

// 화면전환과 메모저장을 모두 처리함
// 위의 작업을 위해, SceneCoordinator와 MemoStorage을 사용함
// 생성자에서 의존성을 주입해줘야함.
class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
