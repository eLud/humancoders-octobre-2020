//
//  ViewController.swift
//  FirstApp
//
//  Created by Ludovic Ollagnier on 27/10/2020.
//

import UIKit

class ViewController: UIViewController {

    //variables qui référencent les objets graphiques : Outlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var firstButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        textLabel.text = "Hello World!"

        activityIndicator.stopAnimating()

        firstButton.setTitle("Activate spinner", for: .normal)
        firstButton.setTitle("Button disabled", for: .disabled)
    }

    //fonctions appelées par l'UI : Actions

    @IBAction func buttonTapped(_ sender: UIButton) {

        if activityIndicator.isAnimating {
            activityIndicator.stopAnimating()
        } else {
            activityIndicator.startAnimating()
        }

        sender.isEnabled = false
    }
}

