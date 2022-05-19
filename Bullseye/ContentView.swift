//
//  ContentView.swift
//  Bullseye
//
//  Created by Oluwatumininu Ojo on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    var sliderValueRounded: Int {
        Int(sliderValue.rounded())
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                Text("Put the text as close as you can to:")
                Text("\(self.target)")
            }
            
            Spacer()
            
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()
            
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }.alert(isPresented: self.$alertIsVisible) {
                Alert(
                    title: Text("Hello there!"),
                    message: Text(self.scoringMessage()),
                    dismissButton: .default(Text("Awesome")))
            }
            
            Spacer()
            
            HStack {
                
                Button(action: {}) {
                    Text("Start over")
                }
                
                Spacer()
                
                Text("Score:")
                Text("99999")
                
                Spacer()
                
                Text("Round:")
                Text("99999")
                
                Button(action: {}) {
                    Text("Info")
                }
                
            }
            .padding(.bottom, 20)
        }
        
    }
    
    func pointsForCurrentRound() -> Int {
        let difference: Int
        if sliderValueRounded > self.target {
            difference = sliderValueRounded - self.target
        } else if self.target > sliderValueRounded {
            difference = self.target - sliderValueRounded
        } else {
            difference = 0
        }
        return 100 - difference
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(self.sliderValueRounded).\n" +
        "The target value is \(self.target).\n" +
        "You scored \(self.pointsForCurrentRound()) points this round."
    }
}
