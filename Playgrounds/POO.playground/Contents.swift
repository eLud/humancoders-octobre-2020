import UIKit

//Structures

//Structs can't make inheritance
struct Track {

    let position: Int
    let name: String
    let album: String
    let author: String
    var listened: Bool

    func play() {
        // Play the track
    }
}

//Classes

//Classes can make inheritance
class Album {

    let name: String
    let year: Int
    let tracks: [Track]
    var listened: Bool

    init(name: String, year: Int, tracks: [Track], listened: Bool = false) {
        self.name = name
        self.year = year
        self.tracks = tracks
        self.listened = listened
    }

    func play() {

    }

    func copy() -> Album {
        return Album(name: self.name, year: self.year, tracks: self.tracks, listened: self.listened)
    }
}

let track1 = Track(position: 0, name: "first song", album: "first album", author: "Me", listened: false)
//Memberwise initializer (struct without any other init)
var track1Listened = track1 // copy
track1Listened.listened = true

let album1 = Album(name: "", year: 2020, tracks: [track1], listened: false)
var albumListened = album1 // reference
albumListened.listened = true

track1.listened //false
track1Listened.listened //true

album1.listened //true
albumListened.listened //true

class Animal {

    var age: Int
    var specie: String

    init(age: Int, specie: String) {
        self.age = age
        self.specie = specie
    }
}

class Cat: Animal {

    var isPurring: Bool

    init(age: Int, specie: String, isPurring: Bool) {
        self.isPurring = isPurring
        super.init(age: age, specie: specie)
    }
}

let patapouf = Cat(age: 11, specie: "Cat", isPurring: true)

//Enumeration

enum Genre {
    case classical
    case rock
    case jazz
    case electro
}

let rock = Genre.rock
