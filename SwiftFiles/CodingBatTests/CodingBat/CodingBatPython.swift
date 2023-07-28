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
    
}
