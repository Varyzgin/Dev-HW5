//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var userData : User? { get }
    func changePage()
}

final class HomePresenter: HomePresenterProtocol {
    private weak var view: HomeViewControllerProtocol?
    internal var userData: User?
    
    init(view: HomeViewControllerProtocol) {
        self.view = view
//        self.userData = UserDefaults.standard.object(forKey: UserDefaultsKeys.userData) as! [UserFields: String?]?
    }
    
    internal func changePage() {
//        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userData)
        NotificationCenter.default.post(name: Notification.Name.WindowManager, object: Pages.ToLogin)
    }
    
    public func configure(user: User) {
        self.userData = user
    }
}
