//
//  BaseTextField.swift
//  Dev-HW5
//
//  Created by Дима on 3/4/25.
//

import UIKit

final class BaseButton: UIButton {
    init(tag: Int, text: String, frame: CGRect, buttonType: ButtonTypes, action: UIAction) {
        super.init(frame: frame)
        
        self.tag = 1
        self.setTitle(text, for: .normal)
        switch buttonType {
        case .primary: self.backgroundColor = .systemBlue
        case .secondary: self.setTitleColor(.systemBlue, for: .normal)
        case .danger: self.setTitleColor(.systemRed, for: .normal)
        }
        self.layer.cornerRadius = 15
        self.addAction(action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
