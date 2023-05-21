//
//  Constants.swift
//  Tippy
//
//  Created by Marco Margarucci on 06/05/23.
//

import Foundation

struct StringConstants {
    
    // MARK: - Global
    struct Global {
        static let currency: String = "€"
    }
    
    // MARK: - Title view
    
    struct TitleViewConstants {
        static let title: String = "Tippy"
    }
    
    // MARK: - Result view
    
    struct ResultViewConstants {
        static let title: String = "Total per person"
    }
    
    // MARK: - Amount view
    
    struct AmountView {
        static let totalBillTitle: String = "Total bill"
        static let totalTipTitle: String = "Total tip"
        static let amountLabelPlaceholder: String = "0€"
    }
    
    // MARK: - Bill view
    
    struct BillView {
        static let doneButtonTitle: String = "Done"
        static let headerLabelText: String = "Enter your bill"
    }
    
    // MARK: - Tip input view
    
    struct TipInputView {
        static let headerLabelText: String = "Choose your tip"
        static let customTipButtonTitle: String = "Custom tip"
    }
    
    // MARK: - Split input view
    
    struct SplitInputView {
        static let headerLabelText: String = "Split the total"
    }
}
