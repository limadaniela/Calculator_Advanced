//
//  ViewController.swift
//  Calculator_Advanced
//
//  Created by Daniela Lima on 2022-07-03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var storedValue: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //what should happen when a non-number button is pressed
        storedValue = true
        
        //guard is to verify that the conversion from string to double can happen
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double")
        }
        //to perform the calculation
        //as currentTitle is an optional string, use optional binding
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //what should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if storedValue {
                displayLabel.text = numValue
                storedValue = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

