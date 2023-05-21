//
//  BillInputView.swift
//  Tippy
//
//  Created by Marco Margarucci on 04/05/23.
//

import UIKit

final class BillInputView: UIView {
    
    // MARK: - Views
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure(text: StringConstants.BillView.headerLabelText)
        return view
    }()
    
    private lazy var textFieldContainerView: UIView = {
        let view = UIView()
        view.addCornerRadius(radius: 10)
        view.backgroundColor = ThemeColor.secondary10
        return view
    }()
    
    private lazy var currencyLabel: UILabel = {
        let label = LabelFactory.build(text: StringConstants.Global.currency,
                                       font: ThemeFont.bold(ofSize: 22))
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.tintColor = ThemeColor.secondary10
        textField.textColor = ThemeColor.text
        textField.borderStyle = .none
        textField.font = ThemeFont.demiBold(ofSize: 22)
        textField.keyboardType = .decimalPad
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        // Toolbar
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 40))
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: StringConstants.BillView.doneButtonTitle,
                                         style: .plain,
                                         target: self,
                                         action: #selector(doneButtonTapped))
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                            target: nil,
                            action: nil),
            doneButton
        ]
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        return textField
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
        [headerView, textFieldContainerView].forEach(addSubview(_:))
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.bottom.equalTo(textFieldContainerView.snp.top).offset(-2)
        }
        
        textFieldContainerView.snp.makeConstraints { make in
            make.top.equalTo(textFieldContainerView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        textFieldContainerView.addSubview(currencyLabel)
        textFieldContainerView.addSubview(textField)
        
        currencyLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(textFieldContainerView.snp.leading).offset(16)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(currencyLabel.snp.trailing).offset(16)
            make.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-16)
        }
    }
    
    @objc private func doneButtonTapped() {
        textField.endEditing(true)
    }
}
