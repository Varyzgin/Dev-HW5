//
//  BaseTextField.swift
//  Dev-HW5
//
//  Created by Дима on 3/4/25.
//

import UIKit

final class BaseTextField: UIView {
    @objc func inputBegin(sender: UITextField) {
        sender.superview?.backgroundColor = .fields
    }
    
    internal lazy var textField: UITextField = {
        $0.font = DynamicFont.set(textStyle: .body)
        $0.addTarget(self, action: #selector(inputBegin), for: .editingDidBegin)
        return $0
    }(UITextField(frame: CGRect(
        origin: CGPoint(x: Margins.S, y: Margins.XS),
        size: CGSize(width: frame.width - Margins.S * 2, height: frame.height - Margins.XS * 2)
    )))
    
    init(placeholderText: String, frame: CGRect, isSecureTextEntry: Bool = false) {
        super.init(frame: frame)
        
        self.backgroundColor = .fields
        self.layer.cornerRadius = 10
        textField.placeholder = placeholderText
        textField.isSecureTextEntry = isSecureTextEntry
        self.addSubview(textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
