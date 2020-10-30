//
//  ContentView.swift
//  CoreDataSwiftUIDemo
//
//  Created by Ludovic Ollagnier on 30/10/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Book.title, ascending: true)], predicate: NSPredicate(format: "title contains %@", "Swift"),
        animation: .default)
    private var items: FetchedResults<Book>

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Author.firstName, ascending: true)], predicate: NSPredicate(format: "title contains %@", "Swift"),
        animation: .default)
    private var author: FetchedResults<Author>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { book in
                    VStack {
                        Text("Title: \(book.title!)")
                        Text(book.author?.firstName ?? "")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationBarItems(trailing: Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            })
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            //Init an object
            let aBook = Book(context: viewContext)
            let anAuthor = Author(context: viewContext)

            //Customize the objects
            aBook.author = anAuthor
            anAuthor.firstName = "Paul"
            anAuthor.lastName = "Auchon"
            aBook.title = "Swift"
            aBook.nbPages = 340

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
