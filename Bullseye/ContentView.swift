//
//  ContentView.swift
//  Bullseye
//
//  Created by Oluwatumininu Ojo on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    // Colors
    let midnightBlue = Color(red: 0, green: 0.2, blue: 0.4)
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    var sliderValueRounded: Int {
        Int(sliderValue.rounded())
    }
    @State var score = 0
    @State var round = 1
    var sliderTargetDifference: Int {
     abs(sliderValueRounded - target)
   }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Text("Put the text as close as you can to:")
                        .modifier(LabelStyle())
                    Text("\(target)")
                        .modifier(ValueStyle())
                }
                Spacer()
                HStack {
                    Text("1")
                        .modifier(LabelStyle())
                    Slider(value: $sliderValue, in: 1...100)
                        .accentColor(Color.green)
                    Text("100")
                        .modifier(LabelStyle())
                }
                Spacer()
                Button(action: {
                    print("Points awarded: \(pointsForCurrentRound())")
                    alertIsVisible = true
                }) {
                    Text("Hit me!")
                        .modifier(ButtonLargeTextStyle())
                }
                .background(Image("Button")
                  .modifier(Shadow())
                )
                .alert(isPresented: $alertIsVisible) {
                    Alert(
                        title: Text(alertTitle()),
                        message: Text(scoringMessage()),
                        dismissButton: .default(Text("Awesome")) {
                            startNewRound()
                        })
                }
                Spacer()
                HStack {
                    Button(action: {
                        startNewGame()
                    }) {
                        HStack {
                            Image("StartOverIcon")
                            Text("Start over").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button")
                        .modifier(Shadow())
                      )
                    Spacer()
                    Text("Score:")
                        .modifier(LabelStyle())
                    Text("\(score)")
                        .modifier(ValueStyle())
                    Spacer()
                    Text("Round:")
                        .modifier(LabelStyle())
                    Text("\(round)")
                        .modifier(ValueStyle())
                    Spacer()
                    NavigationLink(destination: AboutView()) {
                        HStack {
                          Image("InfoIcon")
                          Text("Info").modifier(ButtonSmallTextStyle())
                        }
                      }
                    .background(Image("Button")
                        .modifier(Shadow())
                      )
                }
                .padding(.bottom, 20)
                .accentColor(midnightBlue)
            }
            .onAppear {
                startNewGame()
            }
            .background(Image("Background"))
        }
        .navigationViewStyle(.stack)
    }
    
    func pointsForCurrentRound() -> Int {
      let maximumScore = 100
      let points: Int
      if self.sliderTargetDifference == 0 {
        points = 200
      } else if sliderTargetDifference == 1 {
        points = 150
      } else {
        points = maximumScore - sliderTargetDifference
      }
      return points
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(sliderValueRounded).\n" +
        "The target value is \(target).\n" +
        "You scored \(pointsForCurrentRound()) points this round."
    }
    
    func alertTitle() -> String {
      let title: String
      if sliderTargetDifference == 0 {
        title = "Perfect!"
      } else if sliderTargetDifference < 5 {
        title = "You almost had it!"
      } else if sliderTargetDifference <= 10 {
        title = "Not bad."
      } else {
        title = "Are you even trying?"
      }
      return title
    }
    
    func startNewGame() {
      score = 0
      round = 1
      resetSliderAndTarget()
    }
    
    func startNewRound() {
        score = score + pointsForCurrentRound()
        round += 1
        resetSliderAndTarget()
    }
    
    func resetSliderAndTarget() {
        sliderValue = Double.random(in: 1...100)
        target = Int.random(in: 1...100)
    }
}

// View modifiers
// ==============
struct LabelStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(Font.custom("Arial Rounded MT Bold", size: 18))
      .foregroundColor(Color.white)
      .modifier(Shadow())
} }

struct ValueStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(Font.custom("Arial Rounded MT Bold", size: 24))
      .foregroundColor(Color.yellow)
      .modifier(Shadow())
} }

struct Shadow: ViewModifier {
  func body(content: Content) -> some View {
    content
      .shadow(color: Color.black, radius: 5, x: 2, y: 2)
} }

struct ButtonLargeTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(Font.custom("Arial Rounded MT Bold", size: 18))
      .foregroundColor(Color.black)
} }

struct ButtonSmallTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(Font.custom("Arial Rounded MT Bold", size: 12))
      .foregroundColor(Color.black)
} }
