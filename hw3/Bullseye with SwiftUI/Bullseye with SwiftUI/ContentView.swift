//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State var num: Double = 50
    @State var toggle = false
    var body: some View {
        
        VStack() {
                    HStack() {
                        VStack() {
                            Text("High Score")
                            Text("0")
                        }
                        .padding(.leading, 20)
                        .padding(.top, 20)
                        
                        Spacer()
                        
                        VStack() {
                            Text("Current Level")
                            Text("1")
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                    }
            Spacer()
            
            VStack(){
                Text("Move the slider to:").font(.system(size: 30))
                Text(String(num)).font(.system(size: 30))
                Slider(value: $num, in: 0...100)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                Button("Check"){
                    
                }
            }
            
            Spacer()
            
            VStack(){
                Text("Exact Mode?")
                Toggle("", isOn: $toggle)
                    .padding(.trailing, 170)
            }
                }
    }
}

