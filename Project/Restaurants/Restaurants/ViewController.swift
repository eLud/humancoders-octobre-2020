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

    let library = Library()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    }

}

