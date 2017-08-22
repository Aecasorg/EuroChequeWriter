//
//  GermanCheque.swift
//  EuroChequeWriter
//
//  Created by Henrik Gustavii on 30/04/2017.
//  Copyright © 2017 aecasorg. All rights reserved.
//

import Foundation

class GermanCheque {
    var number:Double = 0
    var writtenNumber = ""
    
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
        
        writtenNumber = "\(convertNumberToAlpha(number: whole)) euros"
        
        if fract != 0 {
            writtenNumber = "\(writtenNumber) und \(convertNumberToAlpha(number: fract)) cent"
        }
        
        return writtenNumber
    }
    
    // returns string of single integer digits
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
        
        if numMillions == 1 {
            writtenNumber = "einen million "
        } else if ((numTenMillions * 10) + numMillions) != 0 {
            writtenNumber = "\(writtenNumber)\(convertTens(number: (numTenMillions * 10) + numMillions)) millionen "
        }
        
        if numHundredThousands == 1 {
            writtenNumber = " hundert "
        } else if numHundredThousands != 0 {
            writtenNumber = "\(writtenNumber)\(convertSingles(number: numHundredThousands)) hundert "
        }
        
        if ((numTenThousands * 10) + numThousands) == 0 && (number < 999999) && (number > 99999) {
            writtenNumber = "\(writtenNumber)tausend "
        }
        
        if ((numTenThousands * 10) + numThousands) != 0 {
            writtenNumber = "\(writtenNumber)\(convertTens(number: (numTenThousands * 10) + numThousands)) tausend "
        }
        
        if numHundreds == 1 {
            writtenNumber = "\(writtenNumber) hundert "
        } else if numHundreds != 0 {
            writtenNumber = "\(writtenNumber)\(convertSingles(number: numHundreds)) hundert "
        }
        
        return "\(writtenNumber)\(convertTens(number: ((numTens * 10) + numSingles)))"
    }
    
    // returns string of single integer digits
    func convertSingles(number: Int) -> String {
        let num = number % 10
        
        if number < 10 || number > 20 {
            switch num {
            case 1:
                return "ein"
            case 2:
                return "zwei"
            case 3:
                return "drei"
            case 4:
                return "vier"
            case 5:
                return "fünf"
            case 6:
                return "sechs"
            case 7:
                return "sieben"
            case 8:
                return "acht"
            case 9:
                return "neun"
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
            writtenNumber = writtenNumber + "zehn"
            break
        case 2:
            writtenNumber = writtenNumber + "zwanzig"
            break;
        case 3:
            writtenNumber = writtenNumber + "dreißig"
            break;
        case 4:
            writtenNumber = writtenNumber + "vierzig"
            break;
        case 5:
            writtenNumber = writtenNumber + "fünfzig"
            break;
        case 6:
            writtenNumber = writtenNumber + "sechzig"
            break;
        case 7:
            writtenNumber = writtenNumber + "siebzig"
            break;
        case 8:
            writtenNumber = writtenNumber + "achtzig"
            break;
        case 9:
            writtenNumber = writtenNumber + "neunzig"
            break;
        default:
            break
        }
        
        if (number % 10) != 0 && !teensNumber {
            if ((number / 10) % 10) == 0 {
                writtenNumber = convertSingles(number: number)
            } else {
                writtenNumber = "\(convertSingles(number: number))und\(writtenNumber)"
            }
        }
        
        return writtenNumber
    }
    
    // converts numbers from 11 to 19
    func convertTeens(number: Int) -> String {
        
        switch number {
            case 11:
                return "elf"
            case 12:
                return "zwölf"
            case 13:
                return "dreizehn"
            case 14:
                return "vierzehn"
            case 15:
                return "fünfzehn"
            case 16:
                return "sechzehn"
            case 17:
                return "siebzehn"
            case 18:
                return "achtzehn"
            case 19:
                return "neunzehn"
            default:
                return "Error with teens"
        }
    }
}
