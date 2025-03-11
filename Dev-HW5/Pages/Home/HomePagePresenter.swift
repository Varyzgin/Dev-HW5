//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import Foundation
import KeychainSwift

protocol HomePresenterProtocol: AnyObject {
    var userData : User? { get }
    func changePage()
}

final class HomePresenter: HomePresenterProtocol {
    private weak var view: HomeViewControllerProtocol?
    internal var userData: User?
    private let keychain = KeychainSwift()
    
    init(view: HomeViewControllerProtocol) {
        self.view = view
        if let userDict = UserDefaults.standard.object(forKey: UserInfoKeys.user.rawValue) as? [String : String] {
            if var user = User.fromDictionary(userDict) {
                if let password = keychain.get("password") { user.password = password }
                self.userData = user
            }
        }
    }
    
    internal func changePage() {
        UserDefaults.standard.removeObject(forKey: UserInfoKeys.user.rawValue)
        keychain.delete("password")
        
        let userInfo: [UserInfoKeys: Any] = [.destinationPage: Pages.ToLogin]
        NotificationCenter.default.post(name: Notification.Name.WindowManager, object: self, userInfo:         userInfo)
    }
    
    public func configure(user: User) {
        self.userData = user
        
        if let password = keychain.get("password") { self.userData?.password = password }
        else { self.userData?.password = "! not_exist !" }
    }
}
