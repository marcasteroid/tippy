//
//  LabelFactory.swift
//  Tippy
//
//  Created by Marco Margarucci on 05/05/23.
//

import UIKit

struct LabelFactory {
    static func build(text: String?,
                      font: UIFont?,
                      backgroundColor: UIColor = .clear,
                      textColor: UIColor = ThemeColor.text,
                      textAlignment: NSTextAlignment? = .center) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.backgroundColor = backgroundColor
        label.textColor = textColor
        if let textAlignment = textAlignment {
            label.textAlignment = textAlignment
        }
        return label
    }
}
