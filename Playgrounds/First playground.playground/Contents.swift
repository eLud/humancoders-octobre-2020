import UIKit

var str: String = "Hello, playground"
str = "Hello, Swift!"

let languageName: String = "Swift"
//languageName = "Objective-C"

let ancientLanguage = "Objective-C"
var objcAge = 34
//objcAge = 34.5

var swiftVersion = 5.3
var objcVersion: Float = 2.0

var total = Float(swiftVersion) + objcVersion
total = 8.0

swiftVersion = 6.0

let a = 5
let b = 2
let c = Double(a) / Double(b)


var villes: [String] = []
var villes1 = [String]()
var villes2 = Array<String>()

var villes3 = ["Paris","Bordeaux","Lyon","Marseille", "Lille"]
let slice = villes3[2...4]
villes3[2...4] = ["NY", "SF"]


func multiply(_ firstNumber: Int, by secondNumber: Int) -> Int {
    return firstNumber * secondNumber
}

multiply(2, by: 10)

villes3.remove(at: 2)
villes3.insert("22", at: 0)

var cities: Set<String> = ["Paris"]
let result = cities.insert("Marseille")

func loadUrl() -> (code: Int, message: String) {
    return (404, "Not Found")
}

let loaded = loadUrl()
loaded.0
loaded.1

var nbHabitants: [String:Int] = ["Paris" : 2250000, "Bordeaux" : 239000, "Lyon" : 491268, "Marseille" : 850636]

let hapParis: Int? = nbHabitants["Paris"] // Int
let hapBerlin: Optional<Int> = nbHabitants["Berlin"] // nil
let hapBdx: Int? = nbHabitants["Bordeaux"] // Int

if let habParis = nbHabitants["Paris"], let habBdx = nbHabitants["Bordeaux"] { // Test / unwrap
    habBdx + habParis
}

let anInt: Int
let anOptional: Int?
