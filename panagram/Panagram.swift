//
//  Panagram.swift
//  panagram
//
//  Created by Christopher Moore on 11/26/17.
//  Copyright © 2017 Christopher Moore. All rights reserved.
//

import Foundation

typealias OptionTypeDefinition = (option: OptionType, value: String)

enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "p": self = .palindrome
        case "a": self = .anagram
        case "h": self = .help
        case "q": self = .quit
        default: self = .unknown
            
        }
    }
}

public class Panagram {
    
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        let argCount = CommandLine.argc // argc returns the amount of args supplied (arg count)
        
        let argument = CommandLine.arguments[1]
        
        let suppliedArg: OptionTypeDefinition = getOption(argument.substring(from: argument.index(argument.startIndex, offsetBy: 1)))
    
        switch suppliedArg.option {
        case .anagram:
            if argCount != 4 {
                if argCount > 4 {
                    consoleIO.writeMessage("Too many args for option \(suppliedArg.option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few args for option \(suppliedArg.option.rawValue)", to: .error)
                }
                consoleIO.printUsage()
                
            } else {
                // supplied the neccessary args 
                let firstString = CommandLine.arguments[2]
                let secondString = CommandLine.arguments[3]
                
                reportAnagram(firstString, string2: secondString)
            }
        case .palindrome:
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.writeMessage("Too many args for option \(suppliedArg.option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few args for option \(suppliedArg.option.rawValue)", to: .error)
                }
            } else {
                let userString = CommandLine.arguments[2]
                reportPalindrome(string: userString)
                
            }
        case .help:
            consoleIO.printUsage()
        case .quit, .unknown:
            consoleIO.writeMessage("Unknown option supplied: \(suppliedArg.value)")
            consoleIO.printUsage()
        }
    }
    
    func interactiveMode() {
        consoleIO.writeMessage("Welcome to Panagram. This program checks if an input string is an anagram or palindrome.")
        
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.writeMessage("Type 'a' for anagram or 'p' for palindrome. 'q' will quit")
            
            let suppliedArgs: OptionTypeDefinition = getOption(consoleIO.getInput())
            switch suppliedArgs.option {
            case .palindrome:
                consoleIO.writeMessage("Type a word or sentance")
                let input = consoleIO.getInput()
                
                reportPalindrome(string: input)
            case .anagram:
                consoleIO.writeMessage("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.writeMessage("Type the second string:")
                let second = consoleIO.getInput()
                
                reportAnagram(first, string2: second)
            case .quit:
                shouldQuit = true
            default:
                consoleIO.writeMessage("Unknown option \(suppliedArgs.value)", to: .error)
            }
        }
    }
    
    func reportAnagram(_ string1: String, string2: String) {
        if string1.isAnagramOf(string2) {
            consoleIO.writeMessage("\(string2) and \(string1) are anagrams")
        } else {
            consoleIO.writeMessage("\(string2) and \(string1) are not anagrams 😞")
        }
    }
    
    func reportPalindrome(string: String) {
        let isPalindrome = string.isPalindrome()
        
        consoleIO.writeMessage("\(string) is \(isPalindrome ? "" : "not ")a palindrome")

    }
    
    func getOption(_ option: String) -> OptionTypeDefinition {
        return (OptionType(value: option), option)
    }
    
}
