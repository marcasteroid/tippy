//
//  CalculatorViewModel.swift
//  Tippy
//
//  Created by Marco Margarucci on 21/05/23.
//

import Foundation
import Combine

class CalculatorViewModel {
    
    // MARK: - Properties
    
    private var cancellables = Set<AnyCancellable>()
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    func transform(input: Input) -> Output {
        let result = Result(amountPerPerson: 300, totalBill: 2322, totalTip: 50.0)
        
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }
}
