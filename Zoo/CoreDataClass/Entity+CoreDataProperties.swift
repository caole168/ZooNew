//
//  Entity+CoreDataProperties.swift
//  Zoo
//
//  Created by caole on 15/10/31.
//  Copyright © 2015年 pincher. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData


extension Entity {

    @NSManaged var title: String?
    @NSManaged var image: String?
    @NSManaged var url: String?

}
