//
//  Habit+CoreDataProperties.swift
//  Habit Grower5
//
//  Created by Yingfan Chen on 9/22/19.
//  Copyright © 2019 Rice University. All rights reserved.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var name: String?

}
