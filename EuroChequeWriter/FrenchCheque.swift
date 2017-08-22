//
//  FrenchCheque.swift
//  EuroChequeWriter
//
//  Created by Henrik Gustavii on 30/04/2017.
//  Copyright © 2017 aecasorg. All rights reserved.
//

import Foundation

class FrenchCheque {
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
            writtenNumber = "\(writtenNumber) et \(convertNumberToAlpha(number: fract)) centimes"
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
        writtenNumber = "un million "
    } else if ((numTenMillions * 10) + numMillions) != 0 {
        writtenNumber = "\(writtenNumber)\(convertTens(number: (numTenMillions * 10) + numMillions)) millions "
    }

    if numHundredThousands == 1 {
        writtenNumber = " cent "
    } else if numHundredThousands != 0 {
        writtenNumber = "\(writtenNumber)\(convertSingles(number: numHundredThousands)) cents "
    }
    
    if ((numTenThousands * 10) + numThousands) == 0 && (number < 999999) && (number > 99999) {
        writtenNumber = "\(writtenNumber)mille "
    }
    
    if ((numTenThousands * 10) + numThousands) != 0 {
        writtenNumber = "\(writtenNumber)\(convertTens(number: (numTenThousands * 10) + numThousands)) mille "
    }
    
    if numHundreds == 1 {
        writtenNumber = "\(writtenNumber) cent "
    } else if numHundreds != 0 {
        writtenNumber = "\(writtenNumber)\(convertSingles(number: numHundreds)) cents "
    }
    
    return "\(writtenNumber)\(convertTens(number: ((numTens * 10) + numSingles)))"
    
    }
    
    // returns string of single integer digits
    func convertSingles(number: Int) -> String {
        let num = number % 10
        
        if number < 10 || number > 20 {
            switch num {
            case 1:
                return "un"
            case 2:
                return "deux"
            case 3:
                return "trois"
            case 4:
                return "cuatre"
            case 5:
                return "cinq"
            case 6:
                return "six"
            case 7:
                return "sept"
            case 8:
                return "huit"
            case 9:
                return "neuf"
            default:
                break
            }
        }
        
        return ""
    }
    
    // returns string of tens
    func convertTens(number: Int) -> String {
        let num = (number / 10) % 10
        var awkwardNumber = false
        var doubleFigureNumber = false
        writtenNumber = ""
        
        switch num {
        case 1:
            if number > 10 && number < 20 {
                writtenNumber = convertTeens(number: number)
                awkwardNumber = true
                break
            }
            writtenNumber = writtenNumber + "dix"
            break
        case 2:
            if number > 20 && number < 30 {
                if number == 21 {
                    writtenNumber = "vingt et "
                    doubleFigureNumber = true
                    break
                }
                writtenNumber = "vingt-"
                doubleFigureNumber = true
                break
            }
            writtenNumber = writtenNumber + "vingt"
            break
        case 3:
            if number > 30 && number < 40 {
                if number == 31 {
                    writtenNumber = "trente et "
                    doubleFigureNumber = true
                    break
                }
                writtenNumber = "trente-"
                doubleFigureNumber = true
                break
            }
            writtenNumber = writtenNumber + "trente"
            break
        case 4:
            if number > 40 && number < 50 {
                if number == 41 {
                    writtenNumber = "quarante et "
                    doubleFigureNumber = true
                    break
                }
                writtenNumber = "quarante-"
                doubleFigureNumber = true
                break
            }
            writtenNumber = writtenNumber + "quarante"
            break
        case 5:
            if number > 50 && number < 60 {
                if number == 51 {
                    writtenNumber = "cinquante et "
                    doubleFigureNumber = true
                    break
                }
                writtenNumber = "cinquante-"
                doubleFigureNumber = true
                break
            }
            writtenNumber = writtenNumber + "cinquante"
            break
        case 6:
            if number > 60 && number < 70 {
                if number == 61 {
                    writtenNumber = "sioxante et "
                    doubleFigureNumber = true
                    break
                }
                writtenNumber = "soixante-"
                doubleFigureNumber = true
                break
            }
            writtenNumber = writtenNumber + "soixante"
            break
        case 7:
            if number > 70 && number < 80 {
                if number == 71 {
                    writtenNumber = "soixante et \(convertTeens(number:number - 60))"
                    awkwardNumber = true
                    break
                }
                writtenNumber = "sioxante-\(convertTeens(number: number - 60))"
                awkwardNumber = true
                break
            }
            writtenNumber = writtenNumber + "soixante-dix"
            break
        case 8:
            if number > 80 && number < 90 {
                writtenNumber = "quatre-vingt-"
                doubleFigureNumber = true
                break
            }
            writtenNumber = writtenNumber + "quatre-vingts"
            break
        case 9:
            if number > 90 && number < 100 {
                writtenNumber = "quatre-vingt-\(convertTeens(number:number - 80))"
                awkwardNumber = true
                break
            }
            writtenNumber = "\(writtenNumber)quatre-vingt-dix"
            break
        default:
            break
        }
        
        if (number % 10) != 0 && !awkwardNumber {
            if doubleFigureNumber || ((number / 10) % 10) == 0 {
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
            return "onze"
        case 12:
            return "douze"
        case 13:
            return "treize"
        case 14:
            return "quatorze"
        case 15:
            return "quinze"
        case 16:
            return "seize"
        case 17:
            return "dix-sept"
        case 18:
            return "dix-huit"
        case 19:
            return "dix-neuf"
        default:
            return "Error with teens"
        }
    }
    
}
