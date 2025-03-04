//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func changePage()
}

final class HomePresenter: HomePresenterProtocol {
    private weak var view: HomeViewControllerProtocol?
    init(view: HomeViewControllerProtocol) {
        self.view = view
    }
    
    internal func changePage() {
        NotificationCenter.default.post(name: Notification.Name.WindowManager, object: Pages.ToLogin)
    }
    
    public func configure(userData: [UserFields: String?]?) {
        if let userData = userData {
            if let text = userData[.nickname] {
                self.view?.greetingsLabel.text = "Hello, \(text!)!"
            }
            if let text = userData[.email] {
                self.view?.emailLabel.text = "Email: \(text!)"
            }
            if let text = userData[.password] {
                self.view?.passwordLabel.text = "Password: \(text!)"
            }
        }
    }
}
