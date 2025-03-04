//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import UIKit

protocol LogInViewControllerProtocol: AnyObject {
    var loginBaseTextField: BaseTextField { get set }
    var passwordBaseTextField: BaseTextField { get set }
}

final class LogInViewController: UIViewController, LogInViewControllerProtocol {
    public var presenter: LogInPresenterProtocol!
    
    private lazy var pageNameLabel: UILabel = {
        $0.text = "Авторизация"
        $0.textAlignment = .center
        $0.textColor = .text
        $0.font = DynamicFont.set(textStyle: .largeTitle, trait: .traitBold)
        return $0
    }(UILabel(
        frame: CGRect(
        origin: CGPoint(x: Margins.M, y: 44 + 100 + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 45)
    )))
    
    internal lazy var loginBaseTextField = BaseTextField(placeholderText: "Почта или логин", frame: CGRect(
        origin: CGPoint(x: Margins.M, y: pageNameLabel.frame.maxY + 2 * Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 50)
    ))
    
    internal lazy var passwordBaseTextField = BaseTextField(placeholderText: "Пароль", frame: CGRect(
        origin: CGPoint(x: Margins.M, y: loginBaseTextField.frame.maxY + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 50)
    ), isSecureTextEntry: true)
    
    private lazy var loginButton = BaseButton(tag: 1, text: "Войти", frame: CGRect(
        origin: CGPoint(x: Margins.M + 45, y: passwordBaseTextField.frame.maxY + 2 * Margins.M),
        size: CGSize(width: view.frame.width - 2 * (Margins.M + 45), height: 50)
    ), buttonType: .primary, action: UIAction { _ in self.presenter.login()} )
    
    private lazy var registerButton = BaseButton(tag: 2, text: "Создать аккаунт", frame: CGRect(
        origin: CGPoint(x: Margins.M + 45, y: loginButton.frame.maxY),
        size: CGSize(width: view.frame.width - 2 * (Margins.M + 45), height: 50)
    ), buttonType: .secondary, action: UIAction { _ in self.presenter.changePage()} )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        view.addSubviews(pageNameLabel, loginBaseTextField, passwordBaseTextField, loginButton, registerButton)
    }
}
