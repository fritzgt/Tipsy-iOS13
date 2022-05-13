//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var tipPct = 10
    
    //MARK: - Outlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func tipChanged(_ sender: UIButton) {
        let selectedTip = sender.currentTitle
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        switch selectedTip {
        case "0%":
            zeroPctButton.isSelected = true
            tipPct = 0
        case "10%":
            tenPctButton.isSelected = true
            tipPct = 10
        case "20%":
            twentyPctButton.isSelected = true
            tipPct = 20
        default:
            break
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValuChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != "" {
            performSegue(withIdentifier: "DetailSegue", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            guard let detailVC = segue.destination as? DetailViewController else { return }
            detailVC.tipPct = Double(tipPct)
            detailVC.totalAmount = Double(billTextField.text ?? "0.0")
            detailVC.splitNum = Double(splitNumberLabel.text ?? "0.0")
        }
    }
}

