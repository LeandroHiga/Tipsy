//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Lean Caro on 24/05/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var numberOfPeople = 0
    var tipPercentage = 0.0
    var final = 0.0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //Go back to first screen
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tip = Int(tipPercentage * 100)
        
        //Update labels
        totalLabel.text = String(format: "%.2f", final)
        settingsLabel.text = "Split between \(String(numberOfPeople)), with\n\(String(tip))% tip"
        
    }
}
