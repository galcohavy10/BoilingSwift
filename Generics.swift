//
//  generics.swift
//  StravaPractice
//
//  Created by Gal Cohavy on 5/4/25.
//

import UIKit

func determineHigherValue<T: Comparable>(valueOne: T, valueTwo: T) {
    let higherValue = valueOne > valueTwo ? valueOne: valueTwo
    print("higher value is the \(higherValue)")

}

// determineHigherValue(valueOne: "sean", valueTwo: "swift"), can compare strings, numbers etc
