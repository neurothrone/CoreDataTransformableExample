//
//  ContentView.swift
//  CoreDataTransformableExample
//
//  Created by Zaid Neurothrone on 2022-09-14.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>
  
  @State private var isAddItemViewPresented = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(items) { item in
          NavigationLink {
            ItemView(item: item)
          } label: {
            HStack {
              CircularView(color: Color(item.color ?? .cyan))
              Text(item.name)
                .font(.headline)
            }
          }
        }
        .onDelete(perform: deleteItems)
      }
      .sheet(isPresented: $isAddItemViewPresented) {
        AddItemView()
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
        
        ToolbarItem {
          Button {
            isAddItemViewPresented.toggle()
          } label: {
            Image(systemName: "plus")
          }
        }
      }
    }
  }
  
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(viewContext.delete)
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environment(
        \.managedObjectContext,
         CoreDataManager.preview.container.viewContext
      )
  }
}
