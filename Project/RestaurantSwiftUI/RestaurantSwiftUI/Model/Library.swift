//
//  Library.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 27/10/2020.
//

import Foundation

class Library: ObservableObject {

    @Published private var restaurants: [Restaurant]

    init(restaurants: [Restaurant] = []) {
        self.restaurants = restaurants

        if restaurants.isEmpty {
            restoreBackup()
        }
    }

    func add(_ restaurant: Restaurant) {
        restaurants.append(restaurant)
        save()
    }

    func remove(_ restaurant: Restaurant) {

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

    func save() {

        guard let data = try? JSONEncoder().encode(restaurants) else { return }

        let fileManager = FileManager.default
        guard let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

        let fullUrl = documentsUrl.appendingPathComponent("backup.json")
        print(fullUrl)


        try? data.write(to: fullUrl)

//        try? fileManager.removeItem(at: fullUrl)
        
//        do {
//            let data = try JSONEncoder().encode(restaurants)
//        } catch {
//            print(error)
//        }
    }

    func restoreBackup() {

        let fileManager = FileManager.default
        guard let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

        let fullUrl = documentsUrl.appendingPathComponent("backup.json")

        guard let data = try? Data(contentsOf: fullUrl) else { return }

        let jsonDecoder = JSONDecoder()
        guard let restaurants = try? jsonDecoder.decode([Restaurant].self, from: data) else { return }

        self.restaurants = restaurants
    }
}
