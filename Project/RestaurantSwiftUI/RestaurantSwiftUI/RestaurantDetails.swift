//
//  RestaurantDetails.swift
//  RestaurantSwiftUI
//
//  Created by Ludovic Ollagnier on 29/10/2020.
//

import SwiftUI

struct RestaurantDetails: View {

    let restaurant: Restaurant

    var body: some View {
        Form {
            VStack {
                Text(restaurant.name)
            }
            Text(restaurant.adress)
            Text("\(restaurant.mediumPrice)")
            HStack {
                Button("Test") {
                    print("b1")
                }
                Button("Test2") {
                    print("b2")
                }
                Button(action: {}, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(.green)
                        Text("Mon button")
                        Image(systemName: "gamecontroller.fill")
                    }
                })
            }.buttonStyle(BorderlessButtonStyle())
            if restaurant.veganFriendly {
                Image(systemName: "leaf.fill")
                    .foregroundColor(.green)
                    .font(.largeTitle)
            }
        }
    }
}

struct RestaurantDetails_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetails(restaurant: Restaurant(name: "Resto de test", style: .burger, adress: "Adresse", mediumPrice: 19.9, veganFriendly: true, alreadyVisited: true))
    }
}
