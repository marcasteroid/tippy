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
            splitInputView,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Functions
    private func configureUI() {
        view.backgroundColor = ThemeColor.background
        view.addSubview(verticalStackView)
        
        let views = [titleView, resultView, billInputView, tipInputView, splitInputView]
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(16)
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.bottom.equalTo(view.snp.bottomMargin).offset(5)
        }
        
        for (index, view) in views.enumerated() {
            view.snp.makeConstraints { make in
                switch index {
                case 0:
                    make.height.equalTo(50)
                case 1:
                    make.height.equalTo(225)
                case 2:
                    make.height.equalTo(60)
                case 3:
                    make.height.equalTo(56+56+16)
                case 4:
                    make.height.equalTo(56)
                default:
                    break
                }
            }
        }
    }
}

