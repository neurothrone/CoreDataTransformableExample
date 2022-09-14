//
//  AddItemView.swift
//  CoreDataTransformableExample
//
//  Created by Zaid Neurothrone on 2022-09-14.
//

import SwiftUI

struct AddItemView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.managedObjectContext) private var viewContext
  
  @State private var name = ""
  @State private var selectedColor: Color = Color.clear
  
  var body: some View {
    Form {
      Section {
        TextField("Name", text: $name)
          .autocorrectionDisabled(true)
          .textInputAutocapitalization(.never)
        
        ColorPicker("Color", selection: $selectedColor)
      }
      
      Section {
        Button("Add Item") {
          addItem()
          dismiss()
        }
        .disabled(name.isEmpty)
      }
    }
  }
}

extension AddItemView {
  private func addItem() {
    withAnimation {
      let newItem = Item(context: viewContext)
      newItem.name = name
      newItem.color = UIColor(selectedColor)
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

struct AddItemView_Previews: PreviewProvider {
  static var previews: some View {
    AddItemView()
      .environment(
        \.managedObjectContext,
         CoreDataManager.preview.container.viewContext
      )
  }
}
