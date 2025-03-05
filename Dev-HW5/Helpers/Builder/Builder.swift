//
//  Builder.swift
//  Dev-HW5
//
//  Created by Дима on 3/4/25.
//

import UIKit

class Builder {
    static func makeRegistrationPage() -> UIViewController {
        let vc = RegistrationViewController()
        let presenter = RegistrationPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
    
    static func makeLogInPage() -> UIViewController {
        let vc = LogInViewController()
        let presenter = LogInPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
    
    static func makeHomePage(user: User) -> UIViewController {
        let vc = HomeViewController()
        let presenter = HomePresenter(view: vc)
        presenter.configure(user: user)
        vc.presenter = presenter
        return vc
    }
}
