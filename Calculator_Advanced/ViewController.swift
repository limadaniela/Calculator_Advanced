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
    
    private var displayValue: Double {
        get {
            //guard is to verify that the conversion from string to double can happen
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //what should happen when a non-number button is pressed
        storedValue = true
        
        //to perform the calculation
        //as currentTitle is an optional string, use optional binding
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue *= -1
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayValue *= 0.01
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //what should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if storedValue {
                //to avoid appending "." more than once in decimal place
                if numValue == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = numValue
                }
                storedValue = false
            } else {
                if numValue == "." && displayLabel.text!.contains(".") {
                    return
                }
            }
            displayLabel.text! += numValue
        }
    }
}


