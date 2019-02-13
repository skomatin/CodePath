//
//  ViewController.swift
//  preWork
//
//  Created by Saikiran Komatineni on 2/12/19.
//  Copyright © 2019 saikiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmt: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var tipPercent: UISegmentedControl!
    
    @IBAction func amtChng(_ sender: Any) {
        let bill = Double(billAmt.text!) ?? 0
        let percentages = [0.1,0.18,0.2]
        
        let tip = bill*percentages[tipPercent.selectedSegmentIndex]
        let totalAmt = tip + bill
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", totalAmt)
    }
    @IBAction func gestureTapped(_ sender: Any) {
        print("Hello")
        view.endEditing(true)
    }
    
}

