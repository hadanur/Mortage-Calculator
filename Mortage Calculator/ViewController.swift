//
//  ViewController.swift
//  Mortage Calculator
//
//  Created by Hakan Adanur on 24.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var purchasePriceLabel: UILabel!
    @IBOutlet weak var repaymentTimeLabel: UILabel!
    @IBOutlet weak var insertRateLabel: UILabel!
    @IBOutlet weak var estimatedMonthLabel: UILabel!
    @IBOutlet weak var purchasePriceSlider: UISlider!
    @IBOutlet weak var repaymentTimeSlider: UISlider!
    @IBOutlet weak var InsertRateSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func purchaseSlider(_ sender: UISlider) {
        let step: Float = 1000
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        purchasePriceLabel.text = "$\(purchasePriceSlider.value)"
        self.purchasePriceSlider.isContinuous = true
        
    }
    
    @IBAction func repaymentSlider(_ sender: UISlider) {
        let step: Float = 0.5
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        repaymentTimeLabel.text = "\(repaymentTimeSlider.value) Years"
        self.repaymentTimeSlider.isContinuous = true
    }
    
    @IBAction func insertSlider(_ sender: UISlider) {
        let step: Float = 0.1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        insertRateLabel.text = "\(InsertRateSlider.value)%"
        self.InsertRateSlider.isContinuous = true
    }
    
    @IBAction func getMortgageButtonClicked(_ sender: Any) {
        let purchasePrice = purchasePriceSlider.value
        let repaymentTime = repaymentTimeSlider.value
        let insertRate = InsertRateSlider.value
        
        let result = purchasePrice + (100 * insertRate / 100) * repaymentTime * 12
        estimatedMonthLabel.text = "\(result)"
    }
    
}

