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
            let userInfo: [UserInfoKeys: Any] = [.destinationPage: Pages.ToHome, .user: user]//, .password: password]
            
//            UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLogin)
//            UserDefaults.standard.set(userData, forKey: UserDefaultsKeys.userData)

            NotificationCenter.default.post(name: Notification.Name.WindowManager, object: self, userInfo: userInfo)
        } else {
            self.view?.loginBaseTextField.backgroundColor = .wrong
            self.view?.passwordBaseTextField.backgroundColor = .wrong
        }
    }
    
    internal func changePage() {
        let userInfo: [UserInfoKeys: Any] = [.destinationPage: Pages.ToRegistration]
        NotificationCenter.default.post(name: Notification.Name.WindowManager, object: self, userInfo: userInfo)
    }
    
    init(view: LogInViewControllerProtocol?) {
        self.view = view
    }
}
