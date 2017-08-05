//
//  Localizacao+CoreDataProperties.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 02/08/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import Foundation
import CoreData


extension Localizacao {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Localizacao> {
        return NSFetchRequest<Localizacao>(entityName: "Localizacao")
    }

    @NSManaged public var dispositoPessoacuidada: String?
    @NSManaged public var localizacaoPessoa: Bool

}
