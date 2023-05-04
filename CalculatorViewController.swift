//
//  CalculatorViewController.swift
//  Tippy
//
//  Created by Marco Margarucci on 04/05/23.
//

import UIKit
import SnapKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Views
    private let titleView = TitleView()
    private let resultView = ResultView()
    private let billInputView = BillInputView()
    private let tipInputView = TipInputView()
    private let splitInputView = SplitInputView()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleView,
            resultView,
            billInputView,
            tipInputView,
            splitInputView
        ])
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(16)
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.bottom.equalTo(view.snp.bottomMargin).offset(5)
        }
        
        titleView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        resultView.snp.makeConstraints { make in
            make.height.equalTo(225)
        }
        
        billInputView.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        tipInputView.snp.makeConstraints { make in
            make.height.equalTo(56+56+16)
        }
        
        splitInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }
}

