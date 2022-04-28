//
//  Model.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import Foundation

struct Memo: Equatable {
    var content: String
    var insertDate: Date
    var identity: String // 메모를 구별할 때 사용하는 Proterty
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
