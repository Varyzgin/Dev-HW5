//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import UIKit

protocol RegistrationViewControllerProtocol : AnyObject {
    func showImagePickerController()
    var imageView: UIImageView { get set }
    var nicknameBaseTextField: BaseTextField { get set }
    var emailBaseTextField: BaseTextField { get set }
    var passwordBaseTextField: BaseTextField { get set }
}

final class RegistrationViewController: UIViewController, RegistrationViewControllerProtocol {
    internal var presenter: RegistrationPresenterProtocol!
    
    private lazy var pageNameLabel: UILabel = {
        $0.text = "Регистрация"
        $0.textColor = .text
        $0.font = DynamicFont.set(textStyle: .largeTitle, trait: .traitBold)
        return $0
    }(UILabel(
        frame: CGRect(
        origin: CGPoint(x: Margins.M, y: 44 + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 45)
    )))
    
    @objc private func chooseImage() {
        presenter.choosePhoto()
    }
    
    internal lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .wrong
        $0.layer.cornerRadius = 20
        $0.image = UIImage(systemName: "plus.app")
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chooseImage)))
        return $0
    }(UIImageView(frame: CGRect(
        origin: CGPoint(x: view.frame.midX - 100, y: pageNameLabel.frame.maxY + Margins.M),
        size: CGSize(width: 200, height: 200)
    )))
    
    internal lazy var nicknameBaseTextField = BaseTextField(placeholderText: "Nickname", frame: CGRect(
        origin: CGPoint(x: Margins.M, y: imageView.frame.maxY + 2 * Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 50)
    ))
    
    internal lazy var emailBaseTextField = BaseTextField(placeholderText: "Email", frame: CGRect(
        origin: CGPoint(x: Margins.M, y: nicknameBaseTextField.frame.maxY + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 50)
    ))
    
    internal lazy var passwordBaseTextField = BaseTextField(placeholderText: "Password", frame: CGRect(
        origin: CGPoint(x: Margins.M, y: emailBaseTextField.frame.maxY + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 50)
    ), isSecureTextEntry: true)
    
    private lazy var registerButton = BaseButton(tag: 1, text: "Отправить", frame: CGRect(
        origin: CGPoint(x: Margins.M + 45, y: passwordBaseTextField.frame.maxY + 2 * Margins.M),
        size: CGSize(width: view.frame.width - 2 * (Margins.M + 45), height: 50)
    ), buttonType: .primary, action: UIAction { _ in self.presenter.register()} )
    
    private lazy var loginButton = BaseButton(tag: 2, text: "Уже есть аккаунт", frame: CGRect(
        origin: CGPoint(x: Margins.M + 45, y: registerButton.frame.maxY),
        size: CGSize(width: view.frame.width - 2 * (Margins.M + 45), height: 50)
    ), buttonType: .secondary, action: UIAction { _ in self.presenter.changePage()} )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        view.addSubviews(pageNameLabel, imageView, nicknameBaseTextField, emailBaseTextField, passwordBaseTextField, registerButton, loginButton)
    }
}

extension RegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true)
    }
}
