//
//  RegistrationPresenter.swift
//  Dev-HW5
//
//  Created by Дима on 3/4/25.
//

import Foundation

protocol RegistrationPresenterProtocol : AnyObject {
    func register()
    func changePage()
    func choosePhoto()
}

final class RegistrationPresenter : RegistrationPresenterProtocol {
    private weak var view: RegistrationViewControllerProtocol?
    init(view: RegistrationViewControllerProtocol?) {
        self.view = view
    }
    
    private var user: User = User(nickname: "", email: "", password: "")
    
    internal func register() {
        var flag: Bool = false
        if let nickname = self.view?.nicknameBaseTextField.textField.text, !nickname.isEmpty {
            user.nickname = nickname
        } else {
            self.view?.nicknameBaseTextField.backgroundColor = .wrong
            flag = true
        }
        if let email = self.view?.emailBaseTextField.textField.text, !email.isEmpty {
            user.email = email
        } else {
            self.view?.emailBaseTextField.backgroundColor = .wrong
            flag = true
        }
        if let password = self.view?.passwordBaseTextField.textField.text, !password.isEmpty  {
            user.password = password
        } else {
            self.view?.passwordBaseTextField.backgroundColor = .wrong
            flag = true
        }
        if flag { return }
        
        let picture = self.view?.imageView.image?.jpegData(compressionQuality: 1)
        
        switch UsersManager.shared.add(user: user, photo: picture) {
        case .existNickname:
            self.view?.nicknameBaseTextField.backgroundColor = .wrong
            self.view?.nicknameBaseTextField.textField.placeholder = "Аккаунт с этим именем существует"
        case .existEmail:
            self.view?.emailBaseTextField.backgroundColor = .wrong
            self.view?.emailBaseTextField.textField.placeholder = "Аккаунт с этой почтой существует"
        case .ok:
            let userInfo: [UserInfoKeys: Any] = [.destinationPage: Pages.ToLogin]
            NotificationCenter.default.post(name: Notification.Name.WindowManager, object: self, userInfo: userInfo)
        }
    }
    
    internal func changePage() {
        let userInfo: [UserInfoKeys: Any] = [.destinationPage: Pages.ToLogin]
        NotificationCenter.default.post(name: Notification.Name.WindowManager, object: self, userInfo: userInfo)
    }
    
    internal func choosePhoto() {
        self.view?.showImagePickerController()
    }
}
