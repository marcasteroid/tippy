//
//  ResultView.swift
//  Tippy
//
//  Created by Marco Margarucci on 04/05/23.
//

import UIKit

final class ResultView: UIView {
    
    // MARK: - Views
    private let headerLabel: UILabel = {
        LabelFactory.build(text: StringConstants.ResultViewConstants.title,
                           font: ThemeFont.demiBold(ofSize: 18))
    }()
    
    private let amountPerPersonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        let text = NSMutableAttributedString(string: "0 €", attributes: [ .font: ThemeFont.bold(ofSize: 24)])
        text.addAttributes([.font: ThemeFont.bold(ofSize: 38)], range: NSMakeRange(0, 1))
        label.attributedText = text
        label.textColor = .white
        return label
    }()
    
    private let horizontalSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.separator
        return view
    }()
    
    private lazy var verticalStackView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [
            headerLabel,
            amountPerPersonLabel,
            horizontalSeparator,
            horizontalStackView
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var horizontalStackView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [
            AmountView(title: StringConstants.AmountView.totalBillTitle,
                       textAlignment: .center),
            UIView(),
            AmountView(title: StringConstants.AmountView.totalTipTitle,
                       textAlignment: .center),
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        self.backgroundColor = ThemeColor.secondary10
        addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(24)
            make.leading.equalTo(snp.leading).offset(24)
            make.trailing.equalTo(snp.trailing).offset(-24)
            make.bottom.equalTo(snp.bottom).offset(-24)
        }
        horizontalSeparator.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        addShadow(offset: CGSize(width: 0, height: 10), color: .black, radius: 10, opacity: 0.2)
    }
}
