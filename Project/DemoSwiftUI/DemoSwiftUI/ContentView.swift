//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by Ludovic Ollagnier on 29/10/2020.
//

import SwiftUI

struct ContentView: View {

    @State private var firstName: String = ""
    @State private var isVeganFriendly: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Badge3D(title: firstName, subtitle: "Sous-Titre", angle: 20)
                .padding()
            Badge3D(title: "firstName", subtitle: "En plus petit", angle: 5)
                .padding(.top, 30)
            TextField("First name", text: $firstName)
            TextField("Last name", text: $firstName)
            Text(firstName)
            Toggle("Is Vegan friendly", isOn: $isVeganFriendly)
        }
    }
}

struct Badge3D: View {

    var title: String
    let subtitle: String
    let angle: Double

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
        .padding()
        .background(Color.green.cornerRadius(10))
        .rotation3DEffect(Angle(degrees: angle), axis: (x: 10.0, y: 10.0, z: 10.0))
        .shadow(radius: 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
