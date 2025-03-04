//
//  ViewController.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    var greetingsLabel : UILabel { get set }
    var emailLabel : UILabel { get set }
    var passwordLabel : UILabel { get set }
}

final class HomeViewController: UIViewController, HomeViewControllerProtocol {
    public var presenter : HomePresenterProtocol!
    
    internal lazy var greetingsLabel: UILabel = {
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
    
    internal lazy var emailLabel: UILabel = {
        $0.textColor = .text
        $0.font = DynamicFont.set(textStyle: .body)
        return $0
    }(UILabel(frame: CGRect(
        origin: CGPoint(x: Margins.M, y: greetingsLabel.frame.maxY + Margins.M),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 25)
    )))
    
    internal lazy var passwordLabel: UILabel = {
        $0.textColor = .text
        $0.font = DynamicFont.set(textStyle: .body)
        return $0
    }(UILabel(frame: CGRect(
        origin: CGPoint(x: Margins.M, y: emailLabel.frame.maxY + Margins.S),
        size: CGSize(width: view.frame.width - Margins.M * 2, height: 25)
    )))
    
    private lazy var exitButton = BaseButton(tag: 1, text: "Выход из аккаунта", frame: CGRect(
        origin: CGPoint(x: Margins.M + 45, y: view.frame.maxY - 100),
        size: CGSize(width: view.frame.width - 2 * (Margins.M + 45), height: 50)
    ), buttonType: .danger, action: UIAction { _ in  self.presenter.changePage() } )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsLabel.text = "!"
        emailLabel.text = "!"
        passwordLabel.text = "!"

        view.backgroundColor = .secondarySystemBackground
        view.addSubviews(greetingsLabel, emailLabel, passwordLabel, exitButton)
    }
}
