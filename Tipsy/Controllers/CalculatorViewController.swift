//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tip = 0.10
    var split = 2
    var bill = 0.00
    var result = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {

        //Dismiss keyboard
        billTextField.endEditing(true)
        
        //Deselect all tip buttons via IBOutlets
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //Make the button that triggered the IBAction selected
        sender.isSelected = true
        
        //Get the current title of the button that was pressed.
        let buttonTitle = sender.currentTitle!
        //Remove the last character (%) from the title
        let newButtonTitle = buttonTitle.dropLast()
        //Turn the String into a Double
        let tipAsNumber = Double(newButtonTitle)!
        //Divide the percent expressed out of 100 into a decimal
        tip = tipAsNumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        //Dismiss keyboard
        billTextField.endEditing(true)
        
        //Update splitNumberLabel when stepper value is changed
        split = (Int(sender.value))
        splitNumberLabel.text = String(split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

        bill = Double(billTextField.text ?? "0") ?? 0.00
        
        //Calculate final result
        result = (bill * (1 + tip)) / Double(split)
        print(String(format: "%.2f", result))
        
        //Perform segue
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            //This values is passed to ResultViewController
            destinationVC.numberOfPeople = split
            destinationVC.tipPercentage = tip
            destinationVC.final = result
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

