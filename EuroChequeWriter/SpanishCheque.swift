//
//  SpanishCheque.swift
//  EuroChequeWriter
//
//  Created by Henrik Gustavii on 30/04/2017.
//  Copyright © 2017 aecasorg. All rights reserved.
//

import Foundation

class SpanishCheque {
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
            writtenNumber = "\(writtenNumber) y \(convertNumberToAlpha(number: fract)) céntimos"
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
            writtenNumber = "\(writtenNumber)\(convertTens(number: (numTenMillions * 10) + numMillions)) milliones "
        }
        
        if numHundredThousands == 1 {
            writtenNumber = " cien "
        } else if numHundredThousands != 0 {
            writtenNumber = "\(writtenNumber)\(convertSingles(number: numHundredThousands)) cientos "
        }
        
        if ((numTenThousands * 10) + numThousands) == 0 && (number < 999999) && (number > 99999) {
            writtenNumber = "\(writtenNumber)mil "
        }
        
        if ((numTenThousands * 10) + numThousands) != 0 {
            writtenNumber = "\(writtenNumber)\(convertTens(number: (numTenThousands * 10) + numThousands)) mil "
        }
        
        if numHundreds == 1 {
            writtenNumber = "\(writtenNumber) cien "
        } else if numHundreds != 0 {
            writtenNumber = "\(writtenNumber)\(convertSingles(number: numHundreds)) cientos "
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
                return "dos"
            case 3:
                return "tres"
            case 4:
                return "cuatro"
            case 5:
                return "cinco"
            case 6:
                return "seis"
            case 7:
                return "siete"
            case 8:
                return "ocho"
            case 9:
                return "nueve"
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
        var doubleFigureNumber = false
        var twentyNumber = false
        var tensOne = false
        var twentyOneNumber = false
        writtenNumber = ""
        
        switch num {
        case 1:
            if number > 10 && number < 20 {
                writtenNumber = convertTeens(number: number)
                teensNumber = true
                break
            }
            writtenNumber = writtenNumber + "diez"
            break
        case 2:
            if number > 20 && number < 30 {
                if number == 21 {
                    twentyOneNumber = true
                    writtenNumber = writtenNumber + "veinti"
                    break
                } else {
                    twentyNumber = true
                    writtenNumber = writtenNumber + "veinti"
                    break
                }
            }
            writtenNumber = writtenNumber + "veinte"
            break
        case 3:
            if number > 30 && number < 40 {
                if number == 31 {
                    tensOne = true
                } else {
                    doubleFigureNumber = true
                }
            }
            writtenNumber = writtenNumber + "treinta"
            break
        case 4:
            if number > 40 && number < 50 {
                if number == 41 {
                    tensOne = true
                } else {
                    doubleFigureNumber = true
                }
            }
            writtenNumber = writtenNumber + "cuarenta"
            break
        case 5:
            if number > 50 && number < 60 {
                if number == 51 {
                    tensOne = true
                } else {
                    doubleFigureNumber = true
                }
            }
            writtenNumber = writtenNumber + "cinquenta"
            break
        case 6:
            if number > 60 && number < 70 {
                if number == 61 {
                    tensOne = true
                } else {
                    doubleFigureNumber = true
                }
            }
            writtenNumber = writtenNumber + "seisenta"
            break
        case 7:
            if number > 70 && number < 80 {
                if number == 71 {
                    tensOne = true
                } else {
                    doubleFigureNumber = true
                }
            }
            writtenNumber = writtenNumber + "setenta"
            break
        case 8:
            if number > 80 && number < 90 {
                if number == 81 {
                    tensOne = true
                } else {
                    doubleFigureNumber = true
                }
            }
            writtenNumber = writtenNumber + "ochenta"
            break
        case 9:
            if number > 90 && number < 100 {
                if number == 91 {
                    tensOne = true
                } else {
                    doubleFigureNumber = true
                }
            }
            writtenNumber = writtenNumber + "noventa"
            break
        default:
            break
        }
        
        if (number % 10) != 0 && !teensNumber {
            if doubleFigureNumber {
                writtenNumber = "\(writtenNumber) y \(convertSingles(number: number))"
            } else if tensOne {
                writtenNumber = "\(writtenNumber) y /(convertSingles(number: number))o"
            } else if twentyNumber || ((number / 10) % 10) == 0 {
                writtenNumber = writtenNumber + convertSingles(number :number)
            } else if twentyOneNumber {
                writtenNumber = "\(writtenNumber)\(convertSingles(number: number))o"
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
            return "once"
        case 12:
            return "doce"
        case 13:
            return "trece"
        case 14:
            return "catorce"
        case 15:
            return "quince"
        case 16:
            return "dieciséis"
        case 17:
            return "diecisiete"
        case 18:
            return "dieciocho"
        case 19:
            return "diecinueve"
        default:
            return "Error with teens"
        }
    }
}
