//
//  ViewModel.swift
//  Mortage Calculator
//
//  Created by Hakan Adanur on 24.11.2022.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func calculatedPrice(result: Int)
}

class ViewModel {
    weak var delegate: ViewModelDelegate?
    func calculateButtonClicked(purchasePrice: Float, interestRate: Float, repaymentTime: Float) {
        let result = purchasePrice + (interestRate * repaymentTime * 12)
        delegate?.calculatedPrice(result: Int(result))
    }

    func roundValue(_ value: Float, step: Float) -> Float {
        return round(value / step) * step
    }
}
