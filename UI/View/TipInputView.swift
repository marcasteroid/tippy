//
//  TipInputView.swift
//  Tippy
//
//  Created by Marco Margarucci on 04/05/23.
//

import UIKit

final class TipInputView: UIView {
    
    // MARK: - View
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure(text: StringConstants.TipInputView.headerLabelText)
        return view
    }()
    
    private let tenPercentTipButton: UIButton = {
        let tip = Tip.tenPercent
        let button = ButtonFactory.build(attributedText: tip.stringValue,
                            font: ThemeFont.demiBold(ofSize: 18),
                            backgroundColor: ThemeColor.primary,
                            textColor: .white,
                            cornerRadius: 8)
        return button
    }()
    
    private let fiftenPercentTipButton: UIButton = {
        let tip = Tip.fifteenPercent
        let button = ButtonFactory.build(attributedText: tip.stringValue,
                            font: ThemeFont.demiBold(ofSize: 18),
                            backgroundColor: ThemeColor.primary,
                            textColor: .white,
                            cornerRadius: 8)
        return button
    }()
    
    private let twentyPercentTipButton: UIButton = {
        let tip = Tip.twentyPercent
        let button = ButtonFactory.build(attributedText: tip.stringValue,
                            font: ThemeFont.demiBold(ofSize: 18),
                            backgroundColor: ThemeColor.primary,
                            textColor: .white,
                            cornerRadius: 8)
        return button
    }()
    
    private lazy var customTipButton: UIButton = {
        let button = ButtonFactory.build(text: StringConstants.TipInputView.customTipButtonTitle,
                            font: ThemeFont.demiBold(ofSize: 18),
                            backgroundColor: ThemeColor.primary,
                            textColor: .white,
                            cornerRadius: 8)
        return button
    }()
    
    private lazy var buttonHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            tenPercentTipButton,
            fiftenPercentTipButton,
            twentyPercentTipButton
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var buttonVerticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            buttonHorizontalStackView,
            customTipButton
        ])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
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
        [headerView, buttonVerticalStackView].forEach(addSubview(_:))
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(130)
            make.height.equalTo(20)
            make.bottom.equalTo(buttonVerticalStackView.snp.top).offset(-2)
        }
        
        buttonVerticalStackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
