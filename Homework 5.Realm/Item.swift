//
//  Item.swift
//  Homework 5.Realm
//
//  Created by Дмитрий Куприенко on 20.12.2021.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var itemName = ""
}

class Description: Object {
    @objc dynamic var item: Item? = nil
    @objc dynamic var itemType = ""
    @objc dynamic var itemQuantity = ""
}
