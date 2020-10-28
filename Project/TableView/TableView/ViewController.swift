//
//  ViewController.swift
//  TableView
//
//  Created by Ludovic Ollagnier on 28/10/2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let model = ["iPhone 8", "iPhone X", "iPhone XS", "iPhone XR" , "iPhone 11", "iPhone 12"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath)

        let iphoneModel = model[indexPath.row]

        cell.textLabel?.text = iphoneModel
        cell.detailTextLabel?.text = "Cellule index \(indexPath)"

        return cell
    }

}

