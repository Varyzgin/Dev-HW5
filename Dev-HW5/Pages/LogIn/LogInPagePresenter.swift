//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import Foundation

protocol LogInPresenterProtocol : AnyObject {
    func login()
    func changePage()
}

final class LogInPresenter: LogInPresenterProtocol {
    private weak var view: LogInViewControllerProtocol?
    
    internal func login() {
        var flag: Bool = false
        var login = ""
        var password = ""
        if let loginText = self.view?.loginBaseTextField.textField.text, !loginText.isEmpty {
            login = loginText
        } else {
            self.view?.loginBaseTextField.backgroundColor = .wrong
            flag = true
        }
        if let passwordText = self.view?.passwordBaseTextField.textField.text, !passwordText.isEmpty  {
            password = passwordText
        } else {
            self.view?.passwordBaseTextField.backgroundColor = .wrong
            flag = true
        }
        if flag { return }
    
        if let user = UsersManager.shared.find(login: login, password: password) {
            let userData: [UserFields: String?] = [.nickname: user.nickname, .email: user.email, .password: user.password, .name: user.name]
            NotificationCenter.default.post(name: Notification.Name.WindowManager, object: Pages.ToHome, userInfo: userData as [AnyHashable : Any])
        } else {
            self.view?.loginBaseTextField.backgroundColor = .wrong
            self.view?.passwordBaseTextField.backgroundColor = .wrong
        }
    }
    
    internal func changePage() {
        NotificationCenter.default.post(name: Notification.Name.WindowManager, object: Pages.ToRegistration)
    }
    
    init(view: LogInViewControllerProtocol?) {
        self.view = view
    }
}
