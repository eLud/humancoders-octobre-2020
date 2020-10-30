//
//  RestaurantList.swift
//  RestaurantSwiftUI
//
//  Created by Ludovic Ollagnier on 29/10/2020.
//

import SwiftUI

struct RestaurantList: View {

    @EnvironmentObject var library: Library

    @State private var showForm = false

    var body: some View {
        NavigationView {
            List(library.list()) { resto in
                NavigationLink(destination: RestaurantDetails(restaurant: resto),
                               label: {
                                RestoCell(resto: resto)
                               })
            }
            .navigationTitle("Restaurants")
            .navigationBarItems(trailing: Button(action: {
                showForm.toggle()
            }, label: {
                Label("New", systemImage: "plus")
            }))
            .sheet(isPresented: $showForm, content: {
                FormView()
            })
        }
    }
}

struct RestoCell: View {

    let resto: Restaurant

    var body: some View {
        VStack(alignment: .leading) {
            Text(resto.name)
            Text(resto.adress)
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
        if resto.veganFriendly {
            Spacer()
            Image(systemName: "leaf")
        }
    }
}

struct RestaurantList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantList()
            .environmentObject(Library(restaurants: [Restaurant(name: "Resto1", style: .burger, adress: "Adress", mediumPrice: 9.9, veganFriendly: true, alreadyVisited: false)]))
    }
}


