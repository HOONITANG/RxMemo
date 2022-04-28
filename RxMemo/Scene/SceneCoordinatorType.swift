//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    // 현재 scene을 닫고 이전 scene로 이동함
    @discardableResult
    func close(animated: Bool) -> Completable
}
