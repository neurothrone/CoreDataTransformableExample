//
//  Item+CoreDataProperties.swift
//  CoreDataTransformableExample
//
//  Created by Zaid Neurothrone on 2022-09-14.
//
//

import Foundation
import CoreData
import UIKit

extension Item {
  
  @NSManaged public var name: String
  @NSManaged public var color: UIColor?
  @NSManaged public var timestamp: Date
  
  public override func awakeFromInsert() {
    super.awakeFromInsert()
    
    timestamp = Date()
  }
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
    return NSFetchRequest<Item>(entityName: String(describing: Item.self))
  }
}

extension Item : Identifiable {}
