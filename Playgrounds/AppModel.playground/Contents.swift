import Foundation

//Struct(s)

//Données de base

// Restaurant
// - name (String)
// - style (enum)
// - adress
// - menu
// - medium price (Int / Double)
// - vegan (Bool)

// Menu
// - ...

// Class

// Library
// - restaurants ([Restaurant])
// - func add / remove / list

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

let unStyle = Restaurant.Style.burger
let anotherStyle = Pub.Style.german

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

let library = Library(restaurants: [])
let resto1 = Restaurant(name: "Resto 1", style: .burger, adress: "No adress", mediumPrice: 14.99, veganFriendly: true, alreadyVisited: false)

library.add(resto1)
