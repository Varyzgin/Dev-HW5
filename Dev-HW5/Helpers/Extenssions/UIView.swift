//
//  UIView.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
