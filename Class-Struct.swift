//
//  Class-Struct.swift
//  StravaPractice
//
//  Created by Gal Cohavy on 5/4/25.
//

import UIKit

//classes are reference types and structs are value types

//class Car {
//    var year: Int
//    var make: String
//    var color: String
//
//    init(year: Int, make: String, color: String) {
//        self.year = year
//        self.make = make
//        self.color = color
//    }
//}
//
//
//var myCar = Car(year: 2022, make: "Porsche", color: "grey")
//var stolenCar = myCar
//stolenCar.color = "yellow"
//
//print(myCar.color) //will now be yellow, it effectively can be stolen
////good analogy is that when editing these types you are all basically editing the same google doc, vs you making an actual copy
//
//
struct Car {
    var year: Int
    var make: String
    var color: String
}

func stealCar() {
    var myCar = Car(year: 2022, make: "Porsche", color: "grey")
    var stolenCar = myCar
    stolenCar.color = "yellow"
    print(myCar.color) //will now be yellow, it effectively can be stolen
    ////good analogy is that when editing these types you are all basically editing the same google doc, vs you making an actual copy
    //
}

//so to summarize when you need inheritance you go with the class and when u go with the struct you're getting something more lightweight and performant



