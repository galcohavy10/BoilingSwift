//
//  Singleton.swift
//  StravaPractice
//
//  Created by Gal Cohavy on 5/4/25.
//
// Singletons are an instance of a class that can only be created once and are globally accessible.
//
// For example, UserDefaults, is persistent data so that every time you open the app you have the same data.

// The reason to use a singleton: It must be because UNIQUENESS is extremely necessary

// Cons: this can get very tricky handling data globally. Be careful and don't use for convenience's sake.


import Foundation

final class MySingleton {
    static let shared = MySingleton
    private init() {} //this guarantees the characteristics of a singleton because it is privately initialized so you can't instantiate a new reference to the class.
    func doSomething() {}
    
}

/*
 example usage
 MySingleton.doSomething()
 */
