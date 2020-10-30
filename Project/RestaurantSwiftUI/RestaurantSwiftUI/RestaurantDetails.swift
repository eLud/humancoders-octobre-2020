//
//  RestaurantDetails.swift
//  RestaurantSwiftUI
//
//  Created by Ludovic Ollagnier on 29/10/2020.
//

import SwiftUI

struct RestaurantDetails: View {

    let restaurant: Restaurant

    @State var image: Image?

    var body: some View {
        Form {
            if let image = image {
                image
            }
            VStack {
                Text(restaurant.name)
            }
            Text(restaurant.adress)
            Text("\(restaurant.mediumPrice)")
            HStack {
                Button("Test") {
                    print("b1")
                }
                Button("Test2") {
                    print("b2")
                    getImage()
                }
                Button(action: {}, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(.green)
                        Text("Mon button")
                        Image(systemName: "gamecontroller.fill")
                    }
                })
            }.buttonStyle(BorderlessButtonStyle())
            if restaurant.veganFriendly {
                Image(systemName: "leaf.fill")
                    .foregroundColor(.green)
                    .font(.largeTitle)
            }
        }
    }

    func getImage() {
        let req = NetworkRequester()
        req.getImage { image in
            guard let image = image else { return }
            self.image = Image(uiImage: image)
            print("Fin closure")
        }
        print("Fin getImage")
    }
}

struct RestaurantDetails_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetails(restaurant: Restaurant(name: "Resto de test", style: .burger, adress: "Adresse", mediumPrice: 19.9, veganFriendly: true, alreadyVisited: true))
    }
}
