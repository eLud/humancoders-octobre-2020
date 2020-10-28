//
//  Pub.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 27/10/2020.
//

import Foundation

struct Pub {

    enum Style {
        case irish, german, belgan
    }

    let name: String
    let style: Style
    let adress: String
    let mediumPrice: Double
    let veganFriendly: Bool
    var alreadyVisited: Bool
}
