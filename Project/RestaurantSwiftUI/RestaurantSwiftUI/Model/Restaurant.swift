//
//  Restaurant.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 27/10/2020.
//

import Foundation

struct Restaurant: Identifiable {

    enum Style: String, CaseIterable, Identifiable {
        case japanese, indian, french, burger, healthy, other

        var id: String {
            return self.rawValue
        }
    }

    let id = UUID()
    let name: String
    let style: Style?
    let adress: String
    let mediumPrice: Double
    let veganFriendly: Bool
    var alreadyVisited: Bool
}
