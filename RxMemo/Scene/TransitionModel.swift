//
//  TransitionModel.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import Foundation

// ViewController 전환 방식 열거형
enum TransitionStyle {
    case root
    case push
    case modal
}

enum TrasitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
