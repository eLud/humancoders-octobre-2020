//
//  RestaurantSwiftUIApp.swift
//  RestaurantSwiftUI
//
//  Created by Ludovic Ollagnier on 29/10/2020.
//

import SwiftUI

@main
struct RestaurantSwiftUIApp: App {

    @StateObject var library = Library()

    var body: some Scene {
        WindowGroup {
            RestaurantList()
                .environmentObject(library)
        }
    }
}
