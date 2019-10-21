//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var stop = false
let operations = "+-*/"

func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    switch opString {
    case "+":
        return {x, y in x + y }
    case "-":
        return {x, y in x - y }
    case "*":
        return {x, y in x * y }
    case "/":
        return {x, y in x / y }
    default:
        return {x, y in x + y }
    }
}

func secretGame() {
    print("Secret Game Activated!! What is the missing operator, type \(operations)")
    let operators = Int.random(in: 0..<4)
    let number1 = Int.random(in: 0..<10)
    let number2 = Int.random(in: 0..<10)
    let sum = number1 + number2
    let subtraction = number1 - number2
    let multiply = number1 * number2
    let divide = number1 / number2
    switch operators {
    case 0: sum
        print(0)
    case 1: subtraction
        print(1)
    case 2: multiply
        print(2)
    case 3: divide
        print(3)
    default:
        print("Cannot compute try again"); secretGame()
    }
    
}

func basicCalc() {
    let userInput:String = readLine() ?? ""
    
    let stringToArray = userInput.components(separatedBy: " ")
    guard stringToArray.count == 3 && operations.contains(stringToArray[1]), let indexZero = Double(stringToArray[0]), let indexTwo = Double(stringToArray[2]) else { if stringToArray.contains("?") { return secretGame()
    }   else {
        print("Unable to compute. Try again")
        return basicCalc()
        }
    }
    let closureOperation = mathStuffFactory(opString: stringToArray[1])
    let result = closureOperation(indexZero,indexTwo)
    
    print("result of operation is \(result)")
}

print("enter your calculation question")

repeat {
    basicCalc()
} while stop == false

