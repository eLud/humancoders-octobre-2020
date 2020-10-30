//
//  FormView.swift
//  RestaurantSwiftUI
//
//  Created by Ludovic Ollagnier on 29/10/2020.
//

import SwiftUI

struct FormView: View {

    @State private var name = ""
    @State private var address = ""
    @State private var mediumPrice = ""
    @State private var mediumPriceDouble = 0.0
    @State private var selection: Restaurant.Style = .burger
    @State private var veganFriendly = false
    @State private var visited = false
    @State private var note: Double = 5.0

    @EnvironmentObject var library: Library
    @Binding var showForm: Bool

    //Can be used to dismiss the modal sheet
    @Environment(\.presentationMode) var presMode

//    private var numberFormatter: NumberFormatter = {
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .currency
//        numberFormatter.maximumFractionDigits = 2
//        numberFormatter.currencySymbol = "€"
//        return numberFormatter
//    }()

    var body: some View {
        NavigationView {
            Form {
                Picker("Style", selection: $selection) {
                    ForEach(Restaurant.Style.allCases) { style in
                        Text(style.rawValue)
                            .tag(style)
                    }
                }
                TextField("Name", text: $name)
                TextField("Address", text: $address)
                HStack {
                    Text("Medium Price")
                    TextField("Medium Price", value: $mediumPriceDouble, formatter: NumberFormatter())
                }
                Section {
                    Toggle("Vegan friendly" , isOn: $veganFriendly)
                    Toggle("Visited" , isOn: $visited)
                    if visited {
                        HStack {
                            Slider(value: $note, in: 0...10)
                            Text("\(note, specifier: "%.1f")")
                            Text(String(format: "%.1f", note))
                        }
                    }
                }
                Section {
                    Button("Save") {
                        save()
                    }
                }
            }
            .navigationTitle("New restaurant")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func save() {

        let resto = Restaurant(name: name, style: selection, adress: address, mediumPrice: mediumPriceDouble, veganFriendly: veganFriendly, alreadyVisited: visited)
        print(resto)
        library.add(resto)

        presMode.wrappedValue.dismiss()
//        showForm.toggle()

        let jsonEncoder = JSONEncoder()
        let plistEncoder = PropertyListEncoder()

        if let data = try? plistEncoder.encode(resto) {
            print(data)
        }
        if let data = try? jsonEncoder.encode(resto) {
            print(data)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FormView(showForm: .constant(true))
            FormView(showForm: .constant(false))
                .preferredColorScheme(.dark)
        }.environmentObject(Library(restaurants: [Restaurant(name: "Resto1", style: .burger, adress: "Adress", mediumPrice: 9.9, veganFriendly: true, alreadyVisited: false)]))
    }
}
