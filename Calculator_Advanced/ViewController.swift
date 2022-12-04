//
//  ViewController.swift
//  Calculator_Advanced
//
//  Created by Daniela Lima on 2022-07-03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var storedValue: String = ""
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //what should happen when a non-number button is pressed
        displayLabel.text = ""
        storedValue = ""
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //what should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            displayLabel.text = storedValue + numValue
            storedValue.append(numValue)
        }
    }
}

