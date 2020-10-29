//
//  Library.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 27/10/2020.
//

import Foundation

class Library {

    static let instance = Library()

    private var restaurants: [Restaurant]

    private init(restaurants: [Restaurant] = []) {
        self.restaurants = restaurants
    }

    func add(_ restaurant: Restaurant) {
        restaurants.append(restaurant)

        //Avertir du changement
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: Notification.Name("ModelUpdated"), object: self)
    }

    func remove(_ restaurant: Restaurant) {
        //TO DO

        //Avertir du changement
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: Notification.Name("ModelUpdated"), object: self)
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
