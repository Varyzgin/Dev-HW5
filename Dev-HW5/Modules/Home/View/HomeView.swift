//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import UIKit

final class HomeViewController: UIViewController {
    public func configure(userData: [UserFields: String?]?) {
        if let userData = userData {
            if let text = userData[.nickname] {
                greetingsLabel.text = "Hello, \(text!)!"
            }
            if let text = userData[.email] {
                emailLabel.text = "Email: \(text!)"
            }
            if let text = userData[.password] {
                passwordLabel.text = "Password: \(text!)"
            }
        }
    }
    
    private lazy var greetingsLabel: UILabel = {
//        $0.text = "Hello"//, \(userData[.nickname]!)!"

        $0.numberOfLines = 0
        $0.textColor = .text
        $0.font = DynamicFont.set(textStyle: .largeTitle, trait: .traitBold)

//        let maxWidth = view.frame.width - Margins.M * 2
//                
//        let boundingBox = $0.text?.boundingRect(
//            with: CGSize(width: maxWidth, height: .greatestFiniteMagnitude),
//            options: [.usesLineFragmentOrigin, .usesFontLeading],
//            attributes: [.font: $0.font],
//            context: nil
//        )
//        
//        if let width = boundingBox?.width, let height = boundingBox?.height {
//            $0.frame = CGRect(
//                origin: CGPoint(x: Margins.M, y: 44 + Margins.M),
//                size: CGSize(width: ceil(width), height: ceil(height)))
//        }
    
        return $0
    }(UILabel(
        frame: CGRect(
        origin: CGPoint(x: Margins.M, y: 44 + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 93)
    )
    ))
    
    private lazy var emailLabel: UILabel = {
        $0.textColor = .text
        $0.font = DynamicFont.set(textStyle: .body)
        return $0
    }(UILabel(frame: CGRect(
        origin: CGPoint(x: Margins.M, y: greetingsLabel.frame.maxY + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 25)
    )))
    
    private lazy var passwordLabel: UILabel = {
        $0.textColor = .text
        $0.font = DynamicFont.set(textStyle: .body)
        return $0
    }(UILabel(frame: CGRect(
        origin: CGPoint(x: Margins.M, y: emailLabel.frame.maxY + Margins.S),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 25)
    )))

    @objc private func buttonPressed(sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("WindowManager"), object: Pages.ToLogin)
    }
    
    private lazy var exitButton: UIButton = {
        $0.tag = 2
        $0.setTitle("Выход из аккаунта", for: .normal)
        $0.setTitleColor(.systemRed, for: .normal)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return $0
    }(UIButton(frame: CGRect(
        origin: CGPoint(x: Margins.M + 45, y: view.frame.maxY - 100),
        size: CGSize(width: view.frame.width - 2 * (Margins.M + 45), height: 50)
    )))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsLabel.text = "Placeholder"//\(userData[.nickname]!)!"
        view.backgroundColor = .secondarySystemBackground
        view.addSubviews(greetingsLabel, emailLabel, passwordLabel, exitButton)
    }
}

