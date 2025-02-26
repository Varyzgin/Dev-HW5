//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import UIKit

final class RegistrationViewController: UIViewController {
    private lazy var pageNameLabel: UILabel = {
        $0.text = "Регистрация"
        $0.textAlignment = .center
        $0.textColor = .text
        $0.font = DynamicFont.set(textStyle: .largeTitle, trait: .traitBold)
        return $0
    }(UILabel(
        frame: CGRect(
        origin: CGPoint(x: Margins.M, y: 44 + 100 + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 45)
    )))
    
    private lazy var nameBackgroundView: UIView = {
        $0.backgroundColor = .fields
        $0.layer.cornerRadius = 10
        return $0
    }(UIView(frame: CGRect(
        origin: CGPoint(x: Margins.M, y: pageNameLabel.frame.maxY + 2 * Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 50)
    )))
    private lazy var nameTextField: UITextField = {
        $0.placeholder = "Nickname"
        $0.font = DynamicFont.set(textStyle: .body)
        return $0
    }(UITextField(frame: CGRect(
        origin: CGPoint(x: Margins.S, y: Margins.XS),
        size: CGSize(width: nameBackgroundView.frame.width - Margins.S * 2, height: nameBackgroundView.frame.height - Margins.XS * 2)
    )))
    
    private lazy var emailBackgroundView: UIView = {
        $0.backgroundColor = .fields
        $0.layer.cornerRadius = 10
        return $0
    }(UIView(frame: CGRect(
        origin: CGPoint(x: Margins.M, y: nameBackgroundView.frame.maxY + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 50)
    )))
    private lazy var emailTextField: UITextField = {
        $0.placeholder = "Email"
        $0.font = DynamicFont.set(textStyle: .body)
        return $0
    }(UITextField(frame: CGRect(
        origin: CGPoint(x: Margins.S, y: Margins.XS),
        size: CGSize(width: emailBackgroundView.frame.width - Margins.S * 2, height: emailBackgroundView.frame.height - Margins.XS * 2)
    )))
    
    private lazy var passwordBackgroundView: UIView = {
        $0.backgroundColor = .fields
        $0.layer.cornerRadius = 10
        return $0
    }(UIView(frame: CGRect(
        origin: CGPoint(x: Margins.M, y: emailBackgroundView.frame.maxY + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 50)
    )))
    private lazy var passwordTextField: UITextField = {
        $0.placeholder = "Password"
        $0.font = DynamicFont.set(textStyle: .body)
        return $0
    }(UITextField(frame: CGRect(
        origin: CGPoint(x: Margins.S, y: Margins.XS),
        size: CGSize(width: passwordBackgroundView.frame.width - Margins.S * 2, height: passwordBackgroundView.frame.height - Margins.XS * 2)
    )))
    
    @objc func buttonPressed(sender: UIView) {
        if (sender.tag == 1) {
            var flag: Bool = false
            if nameTextField.text == nil {
                nameBackgroundView.backgroundColor = .wrong
                flag = true
            }
            if emailTextField.text == nil {
                emailBackgroundView.backgroundColor = .wrong
                flag = true
            }
            if passwordTextField.text == nil {
                passwordBackgroundView.backgroundColor = .wrong
                flag = true
            }
            if flag { return }
            
            if UsersManager.shared.add(nickname: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!) {
                NotificationCenter.default.post(name: NSNotification.Name("WindowManager"), object: Pages.ToLogin)
            } else {
                emailBackgroundView.backgroundColor = .wrong
                nameBackgroundView.backgroundColor = .wrong
            }
        } else if (sender.tag == 2) {
            NotificationCenter.default.post(name: NSNotification.Name("WindowManager"), object: Pages.ToLogin)
        }
    }
    private lazy var sendButton: UIButton = {
        $0.tag = 1
        $0.setTitle("Отправить", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return $0
    }(UIButton(frame: CGRect(
        origin: CGPoint(x: Margins.M + 45, y: passwordBackgroundView.frame.maxY + 2 * Margins.M),
        size: CGSize(width: view.frame.width - 2 * (Margins.M + 45), height: 50)
    )))
    
    private lazy var registrationButton: UIButton = {
        $0.tag = 2
        $0.setTitle("Уже есть аккаунт", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return $0
    }(UIButton(frame: CGRect(
        origin: CGPoint(x: Margins.M + 45, y: sendButton.frame.maxY),
        size: CGSize(width: view.frame.width - 2 * (Margins.M + 45), height: 50)
    )))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubviews(pageNameLabel, nameBackgroundView, emailBackgroundView, passwordBackgroundView, sendButton, registrationButton)
        nameBackgroundView.addSubview(nameTextField)
        emailBackgroundView.addSubview(emailTextField)
        passwordBackgroundView.addSubview(passwordTextField)
    }
}

