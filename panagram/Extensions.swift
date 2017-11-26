//
//  Extensions.swift
//  panagram
//
//  Created by Christopher Moore on 11/26/17.
//  Copyright © 2017 Christopher Moore. All rights reserved.
//

import Foundation

extension String {
    
    func isAnagramOf(_ string: String) -> Bool {
        
        let selfSorted = String(self.lowercased().replacingOccurrences(of: " ", with: "").characters.sorted())
        let stringSorted = String(string.lowercased().replacingOccurrences(of: " ", with: "").characters.sorted())
        
        return selfSorted == stringSorted
        
    }
    
    func isPalindrome() -> Bool {
        let selfLower = self.lowercased().replacingOccurrences(of: " ", with: "")
        let selfReversedLower = String(selfLower.characters.reversed())
        
        return selfLower == selfReversedLower
    }
}
