//
//  HeaderView.swift
//  Tippy
//
//  Created by Marco Margarucci on 21/05/23.
//

import UIKit

final class HeaderView: UIView {
    
    // MARK: - Views
    
    private lazy var titleLabel: UILabel = {
        LabelFactory.build(text: nil,
                           font: ThemeFont.bold(ofSize: 14),
                           textAlignment: .left)
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
}
