//
//  ConsoleIO.swift
//  panagram
//
//  Created by Christopher Moore on 11/26/17.
//  Copyright © 2017 Christopher Moore. All rights reserved.
//

import Foundation

class ConsoleIO {
    
    enum OutputType {
        case error, standard
    }
    
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    
    func printUsage() {
        
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        writeMessage("usage:")
        writeMessage("\(executableName) -a string1 string2")
        writeMessage("or")
        writeMessage("\(executableName) -p string")
        writeMessage("or")
        writeMessage("\(executableName) -h to show usage information")
        writeMessage("Type \(executableName) without an option to enter interactive mode.")
    }
    
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: .utf8)
        
        return strData!.trimmingCharacters(in: CharacterSet.newlines)
        
    }
}
