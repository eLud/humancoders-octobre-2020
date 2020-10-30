//
//  NetworkRequester.swift
//  RestaurantSwiftUI
//
//  Created by Ludovic Ollagnier on 30/10/2020.
//

import UIKit

class NetworkRequester {

    //escaping car closure reste vivante après la fonction
    func getImage(completion: @escaping (UIImage?)->()) {

        let url = URL(string: "https://restaurantengine.com/wp-content/uploads/2015/05/startup-restaurants-typically-overspend.jpg")!
        let session = URLSession.shared

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { (data, response, error) in

            guard error == nil else {
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }

            DispatchQueue.main.async {
                //use the data
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }
        task.resume()
        print("Fin requester getImage")
    }

    func parseRestaurant(data: Data) {

    }
}
