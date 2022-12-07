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
    
    //global variable that's a new instance of CalculatorLogic struct
    private var calculator = CalculatorLogic()
    
    //when calculation button is pressed, we call the setNumber func which sets the number inside CalculatorLogic to whatever is currently inside the display.
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //what should happen when a non-number button is pressed
        storedValue = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
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
