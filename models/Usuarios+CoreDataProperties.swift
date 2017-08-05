//
//  Usuarios+CoreDataProperties.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 02/08/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import Foundation
import CoreData


extension Usuarios {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuarios> {
        return NSFetchRequest<Usuarios>(entityName: "Usuarios")
    }

    @NSManaged public var email: String?
    @NSManaged public var nomePessoaCuidada: String?
    @NSManaged public var nomeUsuario: String?
    @NSManaged public var numeroContato: String?
    @NSManaged public var parentesco: String?
    @NSManaged public var senha: String?

}
