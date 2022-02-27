//
// Microwave.swift
//
// Created by Ina Tolo
// Created on 2022-2-23
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The Microwave program implements an application that
// asks the user which item they would like to eat and
// tells them the amount of time it will take to heat up.

import Foundation

// stores exception at runtime
enum MyError: Error {
    case runtimeError(String)
}

// function that throws exception
func catchString() throws {
    throw MyError.runtimeError("Invalid entry!")
}

// declaring constants
let oneMin = 60
let oneFood = 1
let twoFoods = 2
let threeFoods = 3
let onePizza = Double(45)
let oneSub = Double(60)
let oneSoup = Double(105)
let onePointFive = 1.5
let subString = "SUB"
let soupString = "SOUP"
let pizzaString = "PIZZA"

// declaring variable
var time = Double(0)

// displays opening message
print("Today you will find out the amount of time it takes to heat a certain amount of food(s).")
// blank line
print()

// gets input from user
print("Are you heating sub, pizza, or soup?: ")
var foodLower = readLine()
// converts string input to uppercase format
var foodUpper = foodLower!.uppercased()

// sets time to food
if foodUpper == subString {
    time = oneSub
} else if foodUpper == soupString {
    time = oneSoup
} else if foodUpper == pizzaString {
    time = onePizza
} else {
    print("Invalid food option!")
}

if foodUpper == subString || foodUpper == pizzaString || foodUpper == soupString {
    // gets input from user
    print("How many \(foodUpper)(s) are you cooking (max 3)?: ")
    let amountString = readLine()
    // blank line
    print()

    do {
        // converts string input to an integer
        let amountInt = Int(amountString!) ?? 0
        // calculates total time in seconds
        if amountInt == oneFood {
            time *= 1
        } else if amountInt == twoFoods {
            time *= onePointFive
        } else if amountInt == threeFoods {
            time *= 2
        } else if amountInt != Int(amountString!) {
            try catchString()
        } else {
            // displays error message
            print("Quantity not in vaild range!")
            // breaks out of program
            exit(0)
        }

        // calculates minutes
        let minutes = Int(time) / oneMin
        // calculates seconds
        let seconds = time.truncatingRemainder(dividingBy: Double(oneMin))

        // displays results to the user
        print("The total cook time is \(minutes) minutes and \(seconds) seconds.")

    } catch MyError.runtimeError(let errorMessage) {
        // catches invalid strings
        print(errorMessage)
    }
}
