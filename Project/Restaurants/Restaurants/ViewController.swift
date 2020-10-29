//
//  ViewController.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 27/10/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var adressTextField: UITextField!
    @IBOutlet weak var mediumPriceTextField: UITextField!
    @IBOutlet weak var isVeganSwitch: UISwitch!
    @IBOutlet weak var styleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var isVisitedSwitch: UISwitch!

    let library = Library.instance

    var nameOrEmpty: String {
        return nameTextField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        print(view.center)


    }

    @IBAction func save(_ sender: UIButton) {

        // guard condition else { do something return }
        guard let name = nameTextField.text, name.count > 3 else { return }
        guard let adress = adressTextField.text else { return }
        guard let mediumPrice = mediumPriceTextField.text,
              let mediumPriceDouble = Double(mediumPrice) else { return }

        print(name)
        print(adress)
        print(mediumPriceDouble)

        let resto = Restaurant(name: name, style: nil, adress: adress, mediumPrice: mediumPriceDouble, veganFriendly: isVeganSwitch.isOn, alreadyVisited: isVisitedSwitch.isOn)
        library.add(resto)

        print(library.list())

        dismiss(animated: true, completion: nil)

        UIColor.customBack
    }

}

extension UIView {

    //Propriété stockée interdite dans extension
//    var name: String

    var center: CGPoint {
        let origin = self.frame.origin
        let width = self.frame.width
        let height = self.frame.height

        let center = CGPoint(x: origin.x + width / 2, y: origin.y + height / 2)
        return center
    }
}

extension UIColor {

    static var customBack: UIColor {
        return UIColor(named: "customBackground") ?? .black
    }

    var test: String {
        return "toto"
    }
}

extension Restaurant {
    static var randomRestaurant: Restaurant {
        return Restaurant(name: "", style: .burger, adress: "", mediumPrice: 6.8, veganFriendly: true, alreadyVisited: false)
    }
}



//Static (type) Property                instance property
//Computed property
//Stored property

// static var toto: String {} //static computed property
// var toto: String {}        //instance computed property
// static var toto = "Toto"   // static stored property
// var toto = "Toto"          // instance stored property
