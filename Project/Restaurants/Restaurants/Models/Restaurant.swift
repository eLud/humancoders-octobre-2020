//
//  Restaurant.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 27/10/2020.
//

import Foundation

struct Restaurant {

    enum Style {
        case japanese, indian, french, burger, healthy, other
    }

    let name: String
    let style: Style?
    let adress: String
    let mediumPrice: Double
    let veganFriendly: Bool
    var alreadyVisited: Bool


}
