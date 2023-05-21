//
//  ButtonFactory.swift
//  Tippy
//
//  Created by Marco Margarucci on 21/05/23.
//

import UIKit

struct ButtonFactory {
    static func build(text: String,
                      font: UIFont?,
                      backgroundColor: UIColor = .clear,
                      textColor: UIColor = ThemeColor.text,
                      cornerRadius: CGFloat?) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = font
        button.titleLabel?.textColor = textColor
        button.backgroundColor = backgroundColor
        
        if let cornerRadius = cornerRadius {
            button.addCornerRadius(radius: cornerRadius)
        }
        
        return button
    }
    
    static func build(attributedText: String,
                      font: UIFont?,
                      backgroundColor: UIColor = .clear,
                      textColor: UIColor = ThemeColor.text,
                      cornerRadius: CGFloat?) -> UIButton {
        let button = UIButton()
        button.titleLabel?.font = font
        button.titleLabel?.textColor = textColor
        button.backgroundColor = backgroundColor
        
        if let cornerRadius = cornerRadius {
            button.addCornerRadius(radius: cornerRadius)
        }
        
        let text = NSMutableAttributedString(string: attributedText,
                                             attributes: [.font: ThemeFont.bold(ofSize: 18)])
        
        text.addAttributes([.font: ThemeFont.demiBold(ofSize: 12)], range: NSMakeRange(2, 1))
        
        button.setAttributedTitle(text, for: .normal)
        
        return button
    }
}
