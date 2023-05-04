//
//  TipInputView.swift
//  Tippy
//
//  Created by Marco Margarucci on 04/05/23.
//

import UIKit

final class TipInputView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .orange
    }
    
    
}
