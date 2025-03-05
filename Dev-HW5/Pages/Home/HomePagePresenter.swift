//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var userData : [UserFields: String?]? { get }
    func changePage()
}

final class HomePresenter: HomePresenterProtocol {
    private weak var view: HomeViewControllerProtocol?
    internal var userData: [UserFields: String?]?
    init(view: HomeViewControllerProtocol) {
        self.view = view
    }
    internal func changePage() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userData)
        NotificationCenter.default.post(name: Notification.Name.WindowManager, object: Pages.ToLogin)
    }
    
    public func configure(userData: [UserFields: String?]?) {
        self.userData = userData
    }
}
