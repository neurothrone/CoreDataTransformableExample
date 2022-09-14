//
//  ItemView.swift
//  CoreDataTransformableExample
//
//  Created by Zaid Neurothrone on 2022-09-14.
//

import SwiftUI

struct ItemView: View {
  let item: Item
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(item.name)
        .font(.headline)
      
      Text("\(item.timestamp, formatter: itemFormatter)")
        .font(.subheadline)
        .foregroundColor(.secondary)
      
      Spacer()
    }
    .padding()
  }
}

private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

struct ItemView_Previews: PreviewProvider {
  static var previews: some View {
    let context = CoreDataManager.preview.viewContext
    let newItem = Item(context: context)
    newItem.name = "Preview Item"
    newItem.color = UIColor(.purple)
    
    return ItemView(item: newItem)
      .previewLayout(.sizeThatFits)
  }
}
