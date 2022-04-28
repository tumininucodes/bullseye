//
//  ContentView.swift
//  Bullseye
//
//  Created by Oluwatumininu Ojo on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Put the text as close as you can to:")
                Text("100")
            }
            
            HStack {
                Text("1")
                Slider(value: .constant(10))
                Text("100")
            }
            
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }.alert(isPresented: self.$alertIsVisible) {
                Alert(title: Text("Hello there!"), message: Text("This is my first pop-up."), dismissButton: .default(Text("Awesome")))
            }
        }
        
    }
}
