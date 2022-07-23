//
//  AboutView.swift
//  Bullseye
//
//  Created by Oluwatumininu Ojo on 23/07/2022.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("🎯 Bullseye 🎯")
                .modifier(AboutHeadingStyle())
            Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.")
                .modifier(AboutBodyStyle())
                .lineLimit(nil)
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.")
                .modifier(AboutBodyStyle())
                .lineLimit(nil)
            Text("Enjoy!")
                .modifier(AboutBodyStyle())
        }
    }
}

// View modifiers
// ==============
struct AboutHeadingStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(Font.custom("Arial Rounded MT Bold", size: 30))
      .foregroundColor(Color.black)
      .padding(.top, 20)
      .padding(.bottom, 20)
} }
struct AboutBodyStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(Font.custom("Arial Rounded MT Bold", size: 16))
      .foregroundColor(Color.black)
      .padding(.leading, 60)
      .padding(.trailing, 60)
      .padding(.bottom, 20)
} }
