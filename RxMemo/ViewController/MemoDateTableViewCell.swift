//
//  MemoDateTableViewCell.swift
//  RxMemo
//
//  Created by Taehoon Kim on 2022/04/28.
//

import UIKit

class MemoDateTableViewCell: UITableViewCell {
    
    //MARK: LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.numberOfLines = 0
        self.textLabel?.textColor = .lightGray
        self.textLabel?.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
