//
//  DetailViewController.swift
//  Tipsy
//
//  Created by FGT MAC on 5/13/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    var tipPct: Double?
    var totalAmount: Double?
    var splitNum: Double?
    
    //MARK: - Outlets
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var detailText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateTotal()
        setUpDetailLabel()
    }
    
    //MARK: - Actions
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    //MARK: - Helper methods
    private func calculateTotal() {
        guard let tipPct = tipPct, let totalAmount = totalAmount, let splitNum = splitNum  else {
            return
        }
        let totalTip: Double = (tipPct / totalAmount) * 100
        let tipPerPerson = totalTip / splitNum
        let subTotalPerPerson = totalAmount / splitNum
        
        totalPerPerson.text = "$\(subTotalPerPerson + tipPerPerson)"
    }
    
    private func setUpDetailLabel() {
        detailText.text = "Split between \(Int(splitNum!)) people, with \(Int(tipPct!))% tip."
    }
}
