//
//  SplitInputView.swift
//  Tippy
//
//  Created by Marco Margarucci on 04/05/23.
//

import UIKit

final class SplitInputView: UIView {
    
    // MARK: - Views
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure(text: StringConstants.SplitInputView.headerLabelText)
        return view
    }()
    
    private let decrementButton: UIButton = {
        let tip = Tip.tenPercent
        let button = ButtonFactory.build(text: "-",
                            font: ThemeFont.demiBold(ofSize: 18),
                            backgroundColor: ThemeColor.primary,
                            textColor: .white,
                            cornerRadius: 8,
                            corners: [.layerMinXMaxYCorner, .layerMinXMinYCorner])
        return button
    }()
    
    private let incrementButton: UIButton = {
        let tip = Tip.tenPercent
        let button = ButtonFactory.build(text: "+",
                            font: ThemeFont.demiBold(ofSize: 18),
                            backgroundColor: ThemeColor.primary,
                            textColor: .white,
                            cornerRadius: 8,
                            corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner])
        return button
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = LabelFactory.build(text: "1",
                                       font: ThemeFont.bold(ofSize: 20),
                                       backgroundColor: ThemeColor.secondary)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            decrementButton,
            quantityLabel,
            incrementButton
        ])
        stackView.axis = .horizontal
        stackView.spacing = 0
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [headerView, stackView].forEach(addSubview(_:))
        
        stackView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        [decrementButton, incrementButton].forEach { button in
            button.snp.makeConstraints { make in
                make.width.equalTo(button.snp.height)
            }
        }
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(130)
            make.height.equalTo(20)
            make.bottom.equalTo(stackView.snp.top).offset(-2)
        }
    }
}
