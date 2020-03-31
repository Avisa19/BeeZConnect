//
//  ToDo+CoreDataProperties.swift
//  BeeZConnect
//
//  Created by Avisa Poshtkouhi on 3/15/20.
//  Copyright © 2020 Avisa Poshtkouhi. All rights reserved.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var status: Bool
    @NSManaged public var title: String?
    @NSManaged public var id: Double

}
