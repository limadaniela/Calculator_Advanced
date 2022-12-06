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
        
        if let calcMethod = sender.currentTitle {
            
            let calculator = CalculatorLogic(number: displayValue)
            
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil")
            }
            displayValue = result
            
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //what should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if storedValue {
                displayLabel.text = numValue
                storedValue = false
            } else {
                if numValue == "." {
                    guard !displayLabel.text!.contains(".") else {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
