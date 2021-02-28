//
//  SnippetsView.swift
//  Devpet
//
//  Created by 강민석 on 2021/02/28.
//

import SwiftUI
import CoreData

struct SnippetsView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
        VStack {
            HStack {
                Text("Devpet")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
            }
            
            List {
                
            }
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus")
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 30, height: 30)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "gear")
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 30, height: 30)
            }
        }
        .frame(width: 200, height: 300)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

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
        SnippetsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
