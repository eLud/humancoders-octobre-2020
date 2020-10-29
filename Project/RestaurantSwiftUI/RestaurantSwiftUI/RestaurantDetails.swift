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
            Text(restaurant.name)
            Text(restaurant.adress)
            Text("\(restaurant.mediumPrice)")
            if restaurant.veganFriendly {
                Image(systemName: "leaf.fill")
                    .foregroundColor(.green)
            }
        }
    }
}

struct RestaurantDetails_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetails(restaurant: Restaurant(name: "Resto de test", style: .burger, adress: "Adresse", mediumPrice: 19.9, veganFriendly: true, alreadyVisited: true))
    }
}
