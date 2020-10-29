//
//  RestaurantTableViewController.swift
//  Restaurants
//
//  Created by Ludovic Ollagnier on 28/10/2020.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    let library = Library.instance

    override func viewDidLoad() {
        super.viewDidLoad()

        library.add(Restaurant(name: "Resto 1", style: .burger, adress: "Adresse 1", mediumPrice: 7.9, veganFriendly: true, alreadyVisited: false))

        //Dire au tableView qui est son assistant
        tableView.dataSource = self

        //Added a UIRefreshControl for pull to refresh
        let action = UIAction { (action) in
            self.tableView.reloadData()
            print("Refresh")
            self.refreshControl?.endRefreshing()
        }

        self.refreshControl = UIRefreshControl(frame: CGRect.zero, primaryAction: action)

        //Méthode pour iOS 13-
//        self.refreshControl?.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(forName: Notification.Name("ModelUpdated"), object: nil, queue: OperationQueue.main) { notif in
            self.tableView.reloadData()
            print(notif)
        }
    }

    @IBAction func refresh(_ sender: UIBarButtonItem) {

        sender.isEnabled = false
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return library.list().count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restoCell", for: indexPath)

        // Configure the cell...
        let resto = library.list()[indexPath.row]
        cell.textLabel?.text = resto.name
        cell.detailTextLabel?.text = resto.adress

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
