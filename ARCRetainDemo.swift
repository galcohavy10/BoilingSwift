//
//
//  ARCRetainDemo.swift
//
//  This file illustrates Swift’s memory management using ARC (Automatic Reference Counting)
//  and why we use `weak` to avoid **retain cycles** that prevent memory from being freed.
//
//  PROBLEM:
//  If two objects hold strong references to each other, neither can be deallocated,
//  even if nothing else in the app points to them. This creates a memory leak.
//
//  SOLUTION:
//  Use `weak` to make one of the references non-owning,
//  allowing ARC to clean up when no strong references remain.
//
//  THIS DEMO:
//  - A `Person` has a reference to an `Apartment`.
//  - An `Apartment` also has a reference back to its `tenant` (the `Person`).
//  - If both are `strong`, `deinit` never runs.
//  - If `tenant` is marked `weak`, then both objects are deallocated correctly.
//

import Foundation

class Person {
    let name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
        print("👤 Person \(name) initialized")
    }

    deinit {
        print("👤 Person \(name) deinitialized")
    }
}

class Apartment {
    let unit: String

    // Toggle this line to see the difference:
    // var tenant: Person?         // ❌ Retain cycle: deinit never called
    weak var tenant: Person?       // ✅ Weak reference: allows cleanup

    init(unit: String) {
        self.unit = unit
        print("🏢 Apartment \(unit) initialized")
    }

    deinit {
        print("🏢 Apartment \(unit) deinitialized")
    }
}

// MARK: - Run the test in a local scope so memory can be freed

func runARCExample() {
    var sean: Person? = Person(name: "Sean")
    var apt: Apartment? = Apartment(unit: "4B")

    sean?.apartment = apt
    apt?.tenant = sean

    // Break the last strong references
    sean = nil
    apt = nil
}
