//
//  TitleView.swift
//  Tippy
//
//  Created by Marco Margarucci on 04/05/23.
//

import UIKit

final class TitleView: UIView {
    
    // MARK: - Views
    private let label: UILabel = {
        LabelFactory.build(text: StringConstants.TitleViewConstants.title,
                           font: ThemeFont.demiBold(ofSize: 22))
    }()
    
    // MARK: - Functions
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = ThemeColor.background
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    
}
