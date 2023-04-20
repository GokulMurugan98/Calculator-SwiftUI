//
//  CalculatorModel.swift
//  Calculator-SwiftUI
//
//  Created by Gokul Murugan on 2023-04-19.
//

import Foundation
import SwiftUI

enum keys:String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiplication = "*"
    case division = "/"
    case point = "."
    case negative = "-/+"
    case clear = "AC"
    case percentage = "%"
    case equal = "="
    
    var buttonColor:Color{
        switch self{
        case .add,.subtract,.multiplication,.division,.equal:
                return Color("OperationColor")
        case .clear,.percentage,.negative:
             return Color("OtherOperations")
        default:
            return Color("NumberColor")
        }
    }
}

enum operations{
    
    case add, subtract, multiply, divide, none
    
}
