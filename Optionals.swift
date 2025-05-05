//
//  Optionals.swift
//  StravaPractice
//
//  Created by Gal Cohavy on 5/4/25.
//

import Foundation
import UIKit

struct User {
    let name: String?
    let age: Int?
}

let user = User(name: "Sean", age: nil)

// IF LET
if let age = user.age {
    print("User's age is \(age)")
} else {
    print("User did not enter an age")
}

// GUARD LET
func check(age: Int?) {
    guard let age else {
//        print("Age is nil")
        return
    }

    if age > 40 {
        print("You are old")
    }
}

check(age: user.age)


//nil coalescing
let age = user.age ?? 0
let name = user.name ?? "no name"

//force unwrap: probably never do this, but some situations you could, like don't do it yet if you're inexperienced.
let age = user.age!
