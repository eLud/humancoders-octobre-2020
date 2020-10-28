//
//  Library.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 27/10/2020.
//

import Foundation

class Library {

    private var restaurants: [Restaurant]

    init(restaurants: [Restaurant] = []) {
        self.restaurants = restaurants
    }

    func add(_ restaurant: Restaurant) {
        restaurants.append(restaurant)
    }

    func remove(_ restaurant: Restaurant) {
        //TO DO
    }

    func list() -> [Restaurant] {
        return restaurants
    }

    func bestSearch(string: String) -> Restaurant? {
        //Search by name
        //return best guess
        if restaurants.isEmpty {
            return nil
        }

        return nil
    }
}
