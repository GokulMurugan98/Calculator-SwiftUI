//
//  KeysView.swift
//  Calculator-SwiftUI
//
//  Created by Gokul Murugan on 2023-04-19.
//

import SwiftUI

struct KeysView: View {
    
    @State var value = "0"
    @State var number = 0
    @State var opertaion:operations = .none
    @State private var colorChange = false
    @State private var isDecimal = false
    
    let buttons:[[keys]] = [
        [.clear, .negative,.percentage,.division],
        [.seven,.eight,.nine,.multiplication],
        [.four,.five,.six,.subtract],
        [.one,.two,.three,.add],
        [.zero,.point,.equal]
    ]
    
    var body: some View {
        
        VStack{
            
            HStack{
                RoundedRectangle(cornerRadius: 35)
                    .foregroundColor(colorChange ? Color.pink : Color.red)
                    .scaleEffect(colorChange ? 1.5 : 1.0)
                    .opacity(colorChange ? 0.5 : 0.3)
                    .frame(width: 350,height: 280)
                    .overlay(
                        Text(value)
                            .font(.system(size: 100))
                            .fontDesign(.rounded)
                            .fontWeight(.bold)
                    )
                    .animation(Animation.easeInOut.speed(0.4).repeatForever(), value: colorChange)
                    .onAppear(perform: {
                        self.colorChange.toggle()
                    })
                    .padding(.all)
            }
            ForEach(buttons, id: \.self){row in
                HStack(spacing: 10){
                    ForEach(row, id: \.self){ elememts in
                        Button {
                            didTap(elememts)
                        } label: {
                            Text(elememts.rawValue)
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                                .frame(width: self.getWidth(elem: elememts),height: self.getHeight(elem: elememts))
                                .background(elememts.buttonColor)
                                .cornerRadius(self.getWidth(elem: elememts))
                                .shadow(color: .mint .opacity(0.8), radius: 30)
                        }
                    }
                }.padding(.bottom, 20)
            }
        }
        
        
        
        
    }
    
    func getHeight(elem:keys) -> CGFloat{
        
        return (UIScreen.main.bounds.width - (5*10)) / 5
    }
    
    func getWidth(elem:keys)->CGFloat{
        
        if elem == .zero{
            return (UIScreen.main.bounds.width - (5*10)) / 2
        }
        return (UIScreen.main.bounds.width - (5*10)) / 4
    }
    
    func didTap(_ button:keys){
        
        let initialValue = Int(value) ?? 0
        
        if value.contains("."){
            isDecimal = true
        }else {
            isDecimal = false
        }
        switch button{
        case .add,.subtract,.multiplication,.division,.equal:
            if button == .add{
                opertaion = .add
                number = initialValue
            }else if button == .subtract{
                opertaion = .subtract
                number = initialValue
            }else if button == .multiplication{
                opertaion = .multiply
                number = initialValue
            }else if button == .division{
                opertaion = .divide
                number = initialValue
            }else if button == .equal{
                let runningNumber = number
                let currentNumber = initialValue
                switch opertaion{
                case .add: value = "\(runningNumber + currentNumber)"
                case .subtract: value = "\(runningNumber - currentNumber)"
                case .multiply: value = "\(runningNumber * currentNumber)"
                case .divide: value = "\(runningNumber / currentNumber)"
                case .none: break
                }
            }
            if button != .equal{
                value = "0"
            }
            
        case .clear:
            value = "0"
            number = 0
        case .negative:
            value = "\(initialValue * -1)"
            print(button.rawValue)
        case .percentage:
            if isDecimal{
                print(value)
                value = "\(Float(value)! / 100)"
            }else{
                value = "\(Double(initialValue) / 100)"
            }
        case .point:
            
            if isDecimal == false{
                value = "\(value)."
                isDecimal = true
            }
            
        default:
            if value == "0"{
                value = "\(button.rawValue)"
            }else{
                value = "\(value)\(button.rawValue)"
            }
            
            
            
        }
        
    }
}

struct KeysView_Previews: PreviewProvider {
    static var previews: some View {
        KeysView()
    }
}
