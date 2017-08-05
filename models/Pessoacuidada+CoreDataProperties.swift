//
//  Pessoacuidada+CoreDataProperties.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 02/08/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import Foundation
import CoreData


extension Pessoacuidada {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pessoacuidada> {
        return NSFetchRequest<Pessoacuidada>(entityName: "Pessoacuidada")
    }

    @NSManaged public var dataNascimento: NSDate?
    @NSManaged public var localizacaoPessoa: Bool
    @NSManaged public var nomeCuidador: String?
    @NSManaged public var nomepessoacuidada: String?
    @NSManaged public var numerodispositivo: String?

}
