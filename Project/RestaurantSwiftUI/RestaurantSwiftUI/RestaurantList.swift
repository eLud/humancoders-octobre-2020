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
                    .contextMenu(ContextMenu(menuItems: {
                        Text("Menu Item 1")
                        Text("Menu Item 2")
                        Text("Menu Item 3")
                    }))
            }
            .navigationTitle("Restaurants")
            .navigationBarItems(trailing: Button(action: {
                showForm.toggle()
            }, label: {
                Label("New", systemImage: "plus")
            }).contextMenu(ContextMenu(menuItems: {
                Text("Menu Item 1")
                Text("Menu Item 2")
                Text("Menu Item 3")
            })))
            .sheet(isPresented: $showForm, content: {
                FormView(showForm: $showForm)
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


