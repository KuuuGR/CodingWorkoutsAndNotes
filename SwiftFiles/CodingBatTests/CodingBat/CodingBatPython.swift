//
//  CodingBatPython.swift
//  CodingBat
//
//  Created by Grzegorz Kulesza on 28/07/2023.
//

import Foundation


class WarmupOneManager {
    
    //MARK: Python Warmup-1
    //https://codingbat.com/python/Warmup-1
    
    /**
     Function that determines whether you can sleep in or not.
     
     - Parameters:
       - weekday: A boolean value indicating whether it's a weekday.
       - vacation: A boolean value indicating whether you're on vacation.
     
     - Returns: A boolean value indicating whether you can sleep in. You can sleep in if it's not a weekday or if you're on vacation.
     
     - Note: Task address: https://codingbat.com/prob/p187868
    */
    func sleepIn(_ weekday: Bool, _ vacation: Bool) -> Bool {
        return !weekday || vacation
    }

    
    /**
     Function that calculates the absolute difference between an input integer and 21.
     
     - Parameters:
     - n: The input integer.
     
     - Returns: The absolute difference between the input integer and 21. If the input integer is greater than 21, it returns double the absolute difference.
     
     - Note: This function does not handle negative input values. Task adress:  https://codingbat.com/prob/p197466
     */
    func diff21(n: Int) -> Int {
        if n <= 21 {
            return abs(n - 21)
        } else {
            return 2 * abs(n - 21)
        }
    }
    
    /**
       Given an integer `n`, the `nearHundred` function determines whether it is within 10 of 100 or 200.
       
       - Parameters:
            - n: The integer input value.
       
       - Returns: `true` if the input integer is within 10 of 100 or 200, `false` otherwise.
    */
    func nearHundred(_ n: Int) -> Bool {
        let diffFrom100 = abs(n - 100)
        let diffFrom200 = abs(n - 200)
        
        return diffFrom100 <= 10 || diffFrom200 <= 10
    }


    /**
     Returns a new string where the character at the specified index has been removed.

     - Parameters:
        - str: The original input string.
        - index: The index of the character to be removed. It should be a valid index in the range 0..len(str)-1 inclusive.

     - Returns: A new string with the character at the given index removed.

     - Note: The function assumes that the index provided is a valid index in the input string.
     */
    func missingChar(_ str: String, _ index: Int) -> String {
        var result = str
        result.remove(at: str.index(str.startIndex, offsetBy: index))
        return result
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
