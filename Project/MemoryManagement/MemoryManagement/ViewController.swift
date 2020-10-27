//
//  ViewController.swift
//  MemoryManagement
//
//  Created by Ludovic Ollagnier on 27/10/2020.
//

import UIKit

class Human {
    let name: String
    var child: Human?
    weak var father: Human?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(name) will be deallocated")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        DispatchQueue.global(qos: .utility).async {
            for _ in 0...200_000 {
                self.makeLeak()
            }
        }
    }

    func makeLeak() {
        let aPerson = Human(name: "Ludovic")
        print(aPerson)
        let anotherPerson = Human(name: "Robert")
        print(anotherPerson)

        aPerson.child = anotherPerson
        anotherPerson.father = aPerson
    }

}

