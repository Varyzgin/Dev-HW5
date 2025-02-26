//
//  Fonts.swift
//  Dev-HW5
//
//  Created by Дима on 2/13/25.
//

import UIKit

final class DynamicFont : UIFont, @unchecked Sendable {
    public static func set(textStyle: UIFont.TextStyle, trait: UIFontDescriptor.SymbolicTraits? = nil) -> UIFont {
        let base = UIFont.preferredFont(forTextStyle: textStyle)
        if let trait = trait {
            return UIFont(descriptor: base.fontDescriptor.withSymbolicTraits(trait) ?? base.fontDescriptor, size: 0)
        }
        return UIFont(descriptor: base.fontDescriptor, size: 0)
    }
    
    public static func calculateTextFrame(for text: String, with font: UIFont, maxWidth: CGFloat) -> CGRect {
       let constraintSize = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)
       
       let boundingBox = text.boundingRect(
           with: constraintSize,
           options: [.usesLineFragmentOrigin, .usesFontLeading],
           attributes: [.font: font],
           context: nil
       )
       
       return CGRect(origin: .zero, size: CGSize(width: ceil(boundingBox.width), height: ceil(boundingBox.height)))
   }
}
