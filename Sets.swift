//
//  array-set.swift
//  StravaPractice
//
//  Created by Gal Cohavy on 5/4/25.
//
// An array can have multiple items that are the same and keeps order intact, this makes it less performant. As the array gets larger it retains the O(1) lookup time

// Hashset, or Set, has only unique items, and it won't necesarrily be in the same order. With large data, it will retain O(1) runtime
import Foundation
import UIKit

var swiftUIDevs: Set = ["Sean", "James"]
var swiftDevs: Set = ["Sean", "James", "Olivia", "Maya", "Leo"]
var kotlinDevs: Set = ["Olivia", "Elijah", "Leo", "Maya", "Dan"]
var experiencedDevs: Set = ["Sean", "Ava", "Olivia", "Leo", "Maya"]

func setFunctionalitySample() {
    //intersect- find (A intersects B)
    let experiencedSwiftUIDevs = swiftUIDevs.intersection(experiencedDevs)

    //subtract- pull difference
    let jrSwiftDevs = swiftUIDevs.subtracting(experiencedDevs)

    //disjoint: check for overlap at all
    swiftUIDevs.isDisjoint(with: swiftDevs)

    //union: combine
    swiftUIDevs.union(swiftDevs) //would just be swift devs, because the duplicates will not be added
    
    //exclusive- only in 1 set
    let specialists = swiftDevs.symmetricDifference(kotlinDevs)
    
    //subset
    swiftUIDevs.isSubset(of: swiftDevs)
    
    //superset
    swiftDevs.isSuperset(of: swiftUIDevs)
    
    //insert, delete, or find
    swiftDevs.insert("Joe")
    swiftDevs.remove("Sean")
    swiftDevs.contains("Maya")

    
}

