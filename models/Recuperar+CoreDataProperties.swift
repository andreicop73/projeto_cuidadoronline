//
//  Recuperar+CoreDataProperties.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 02/08/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import Foundation
import CoreData


extension Recuperar {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recuperar> {
        return NSFetchRequest<Recuperar>(entityName: "Recuperar")
    }

    @NSManaged public var email: String?
    @NSManaged public var nomeusuario: String?

}
