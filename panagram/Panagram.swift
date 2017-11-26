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
    case unknown
    
    init(value: String) {
        switch value {
        case "p": self = .palindrome
        case "a": self = .anagram
        case "h": self = .help
        default: self = .unknown
            
        }
    }
}

class Panagram {
    
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        let argCount = CommandLine.argc // argc returns the amount of args supplied (arg count)
        
        let argument = CommandLine.arguments[1]
        
        let suppliedArg: OptionTypeDefinition = getOption(argument.substring(from: argument.index(argument.startIndex, offsetBy: 1)))
        
        consoleIO.writeMessage("Argument count: \(argCount) Option: \(suppliedArg.option) value: \(suppliedArg.value)")
    }
    
    func getOption(_ option: String) -> OptionTypeDefinition {
        return (OptionType(value: option), option)
    }
    
}
