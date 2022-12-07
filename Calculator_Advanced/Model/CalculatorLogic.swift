//
//  CalculatorLogic.swift
//  Calculator_Advanced
//
//  Created by D L on 2022-12-05.
//

import Foundation

struct CalculatorLogic {
    
    //optional because when struct CalculatorLogic gets initialized, this number property can be nil.
    //global variables should always have the private access level by default
    private var number: Double?
    
    //optional because when struct CalculatorLogic gets initialized, this tuple can be nil.
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    //to allow other classes to set the value of number property
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    //to perform the calculation
    mutating func calculate(symbol: String) -> Double? {
        
        //if number is a Double, we have to make sure that it's not nil before we use it.
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    //this functionality is internal to our calculator because it performs the second half of the calculation
    //marked as private as it shouldn't be called outside this current structure
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}


