//
//  RestaurantDetailsViewController.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 29/10/2020.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!

    var restaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    private func configureUI() {
        nameLabel.text = restaurant?.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
