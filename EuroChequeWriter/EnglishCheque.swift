//
//  EnglishCheque.swift
//  EuroChequeWriter
//
//  Created by Henrik Gustavii on 26/04/2017.
//  Copyright © 2017 aecasorg. All rights reserved.
//

import Foundation

class EnglishCheque {
    var number:Double = 0
    var writtenNumber = ""
    
//    init(number: Double) {
//        checkNumber(number: number)
//    }
    
    // checks validity if number before converting
    func checkNumber(number: Double) -> String {
    
        if number > 0 {
            return "\(self.convertNumber(number: number))"
        } else {
            return "Writing a cheque for zero money is a bit silly..."
        }
    }
    
    // Converts double to two integers (before and after .) and prints it as written
    func convertNumber(number: Double) -> String {
        var writtenNumber = ""
        
        let whole:Int = Int(number)
        let wholeDouble:Double = Double(Int(whole))
        let fract:Int = Int((number - wholeDouble) * 101)
        
        writtenNumber = "\(convertNumberToAlpha(number: whole)) pounds"
        
        if fract != 0 {
            writtenNumber = "\(writtenNumber) and \(convertNumberToAlpha(number: fract)) pence"
        } else {
            writtenNumber = "\(writtenNumber) only"
        }
        
        // print(writtenNumber)
        return writtenNumber
    }
    
    func convertNumberToAlpha(number: Int) -> String {
        var writtenNumber = ""
        let numTenMillions = (number / 10000000) % 10
        let numMillions = (number / 1000000) % 10
        let numHundredThousands = (number / 100000) % 10
        let numTenThousands = (number / 10000) % 10
        let numThousands = (number / 1000) % 10
        let numHundreds = (number / 100) % 10
        let numTens = (number / 10) % 10
        let numSingles = number % 10

        if ((numTenMillions * 10) + numMillions) != 0 {
            writtenNumber = "\(writtenNumber)\(convertTens(number: (numTenMillions * 10) + numMillions)) million "
        }
        
        if numHundredThousands != 0 {
            writtenNumber = "\(writtenNumber)\(convertSingles(number: numHundredThousands)) hundred "
        }
        
        if ((numTenThousands * 10) + numThousands) == 0 && (number < 999999) && (number > 99999) {
            writtenNumber = "\(writtenNumber)thousand "
        }
        
        if ((numTenThousands * 10) + numThousands) != 0 {
            writtenNumber = "\(writtenNumber)\(convertTens(number: (numTenThousands * 10) + numThousands)) thousand "
        }
        
        if numHundreds != 0 {
            writtenNumber = "\(writtenNumber)\(convertSingles(number: numHundreds)) hundred "
        }
        
        return "\(writtenNumber)\(convertTens(number: ((numTens * 10) + numSingles)))"
        
    }
    
    // returns string of single integer digits
    func convertSingles(number: Int) -> String {
        let num = number % 10
        
        if number < 10 || number > 20 {
            switch num {
            case 1:
                return "one"
            case 2:
                return "two"
            case 3:
                return "tree"
            case 4:
                return "four"
            case 5:
                return "five"
            case 6:
                return "six"
            case 7:
                return "seven"
            case 8:
                return "eight"
            case 9:
                return "nine"
            default:
                break
            }
        }
        
        return ""
    }
    
    // returns string of tens
    func convertTens(number: Int) -> String {
        let num = (number / 10) % 10
        var teensNumber = false
        writtenNumber = ""
        
        switch num {
            case 1:
                if number > 10 && number < 20 {
                    writtenNumber = convertTeens(number: number)
                    teensNumber = true
                    break
                }
                writtenNumber = "\(writtenNumber)ten"
                break
            case 2:
                writtenNumber = "\(writtenNumber)twenty"
                break
            case 3:
                writtenNumber = "\(writtenNumber)thirty"
                break
            case 4:
                writtenNumber = "\(writtenNumber)forty"
                break
            case 5:
                writtenNumber = "\(writtenNumber)fifty"
                break
            case 6:
                writtenNumber = "\(writtenNumber)sixty"
                break
            case 7:
                writtenNumber = "\(writtenNumber)seventy"
                break
            case 8:
                writtenNumber = "\(writtenNumber)eighty"
                break
            case 9:
                writtenNumber = "\(writtenNumber)ninety"
                break
            default:
                break
        }
        
        if (number % 10) != 0 && !teensNumber {
            if ((number / 10) % 10) == 0 {
                writtenNumber = writtenNumber + convertSingles(number: number)
            } else {
                writtenNumber = "\(writtenNumber) \(convertSingles(number: number))"
            }
        }
        
        return writtenNumber
    }
    
    // converts numbers from 11 to 19
    func convertTeens(number: Int) -> String {
        
        switch number {
        case 11:
            return "eleven"
        case 12:
            return "twelve"
        case 13:
            return "thirteen"
        case 14:
            return "fourteen"
        case 15:
            return "fifteen"
        case 16:
            return "sixteen"
        case 17:
            return "seventeen"
        case 18:
            return "eighteen"
        case 19:
            return "nineteen"
        default:
            return "Error with teens"
        }
    }
}



























