//
//  RestaurantSwiftUIApp.swift
//  RestaurantSwiftUI
//
//  Created by Ludovic Ollagnier on 29/10/2020.
//

import SwiftUI

@main
struct RestaurantSwiftUIApp: App {

    @StateObject var library = Library(restaurants: [Restaurant(name: "Resto1", style: .burger, adress: "Address1", mediumPrice: 9.9, veganFriendly: true, alreadyVisited: false)])

    var body: some Scene {
        WindowGroup {
            RestaurantList()
                .environmentObject(library)
        }
    }
}
