//
//  BooksList.swift
//  CoreDataSwiftUIDemo
//
//  Created by Ludovic Ollagnier on 30/10/2020.
//

import SwiftUI

struct BooksList: View {

    var books: [Book]

    var body: some View {
        List(books) { book in
            Text(book.title ?? "No title")
        }
    }
}

//struct BooksList_Previews: PreviewProvider {
//    static var previews: some View {
//        BooksList()
//    }
//}
