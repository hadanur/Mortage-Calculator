//
//  ViewController.swift
//  Mortage Calculator
//
//  Created by Hakan Adanur on 24.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var purchasePriceSlider: UISlider!
    @IBOutlet weak var purchasePriceLabel: UILabel!
    @IBOutlet weak var repaymentTimeSlider: UISlider!
    @IBOutlet weak var repaymentTimeLabel: UILabel!
    @IBOutlet weak var InterestRateSlider: UISlider!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var estimatedMonthLabel: UILabel!
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }

    @IBAction func purchaseSlider(_ sender: UISlider) {
        let step: Float = 1000
        let roundedValue = viewModel.roundValue(sender.value, step: step)
        sender.value = roundedValue
        let purchasePriceInt = Int(purchasePriceSlider.value)
        purchasePriceLabel.text = "$\(purchasePriceInt)"
        self.purchasePriceSlider.isContinuous = true
    }
    
    @IBAction func repaymentSlider(_ sender: UISlider) {
        let step: Float = 0.5
        let roundedValue = viewModel.roundValue(sender.value, step: step)
        sender.value = roundedValue
        repaymentTimeLabel.text = "\(repaymentTimeSlider.value) Years"
        self.repaymentTimeSlider.isContinuous = true
    }
    
    @IBAction func interestSlider(_ sender: UISlider) {
        let step: Float = 0.1
        let roundedValue = viewModel.roundValue(sender.value, step: step)
        sender.value = roundedValue
        interestRateLabel.text = "\(InterestRateSlider.value)%"
        self.InterestRateSlider.isContinuous = true
    }
    
    @IBAction func getMortgageButtonClicked(_ sender: Any) {
        let purchasePrice = purchasePriceSlider.value
        let repaymentTime = repaymentTimeSlider.value
        let interestRate = InterestRateSlider.value

        viewModel.calculateButtonClicked(purchasePrice: purchasePrice, interestRate: interestRate, repaymentTime: repaymentTime)
    }
}

extension ViewController: ViewModelDelegate {
    func calculatedPrice(result: Int) {
        estimatedMonthLabel.text = "$\(result)"
    }
}

