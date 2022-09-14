//
//  CoreDataTransformableExampleApp.swift
//  CoreDataTransformableExample
//
//  Created by Zaid Neurothrone on 2022-09-14.
//

import SwiftUI

@main
struct MainApp: App {
  let coreDataManager = CoreDataManager.shared
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, coreDataManager.viewContext)
    }
  }
}
