//
//  Extensions.swift
//  panagram
//
//  Created by Christopher Moore on 11/26/17.
//  Copyright © 2017 Christopher Moore. All rights reserved.
//

import Foundation

extension String {
    
    func isAnagram(_ string: String) -> Bool {
        
        let selfSorted = self.lowercased().replacingOccurrences(of: " ", with: "").characters.sorted().flatMap { $0 }
        let stringSorted = string.lowercased().replacingOccurrences(of: " ", with: "").characters.sorted().flatMap { $0 }
        
        return selfSorted == stringSorted
        
    }
}
