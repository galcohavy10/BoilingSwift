//
//  filter-map-reduce.swift
//  StravaPractice
//
//  Created by Gal Cohavy on 5/4/25.
//

import UIKit

// a great way to think of this is just shorthand for a for loop essentially

struct IndieApp {
    let name: String
    let monthlyPrice: Double
    let users: Int
}

func manipulating() {
    let appPortfolio = [IndieApp(name: "Creator View", monthlyPrice: 11.99, users: 4356),
                        IndieApp(name: "FitHero", monthlyPrice: 0.00, users: 1756),
                        IndieApp(name: "Buckets", monthlyPrice: 3.99, users: 7598),
                        IndieApp(name: "Connect Four", monthlyPrice: 1.99, users: 34081)]
    
    //filter: returning the array's elements that match a condition
    let freeApps = appPortfolio.filter {$0.monthlyPrice == 0.00}
    let highUsers = appPortfolio.filter {$0.users > 5000}
    let premiumApps = appPortfolio.filter {$0.monthlyPrice > 5}

    //map: usually filtering out by element, or adding a transform to one of the props
    let appNames = appPortfolio.map { $0.name }.sorted()
    let increasedPrices = appPortfolio.map { $0.monthlyPrice * 1.5}
    
    //reduce: returns the result of manipulating the elements with the given closure (or lambdas if you prefer the C++ vernacular)
    let numbers = [3,5,9,12]
    var sum = numbers.reduce(0, +) //first param is the start value, second is the operator
    sum = numbers.reduce(10, -)
    print(sum)
    
    let totalUsers = appPortfolio.reduce(0, { $0 + $1.users }) //0 is the current iteration, so your adding the current and next iteration of the array
    print(totalUsers)
     
    //chaining: careful using this, as it can reduce redability
    let recurringRevenue = appPortfolio.map { $0.monthlyPrice * Double($0.users) }.reduce(0, +) //so we're using th e
    print(recurringRevenue)
    
    //compact map: removes nils from an array
    let nilNumbers: [Int?] = [2,3, nil]
    let nonNilNumbers = nilNumbers.compactMap{ $0 }
    print(nonNilNumbers)
    
    //flat map: flattens multiple dimensioned array
    let arrayOfArrays: [[Int]] = [[1,2,3],
                                  [4,5,6],
                                  [7,8,9]]
    let flattenedArray = arrayOfArrays.flatMap{$0}
    print("flattened array")q
}


