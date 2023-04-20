//
//  ContentView.swift
//  Calculator-SwiftUI
//
//  Created by Gokul Murugan on 2023-04-19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .yellow.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            KeysView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
