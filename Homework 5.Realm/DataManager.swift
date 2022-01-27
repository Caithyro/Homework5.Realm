//
//  DataManager.swift
//  Homework 5.Realm
//
//  Created by Дмитрий Куприенко on 20.12.2021.
//

import Foundation
import RealmSwift

class DataManager {
    
    let realm = try! Realm()
    
    func saveItems(itemName: String, itemType: String, itemQuantity: String) {
        let itemDescription = Description(value: [["\(itemName)"], "\(itemType)", "\(itemQuantity)" ])
        try! realm.write {
            realm.create(Description.self, value: itemDescription)
        }
    }
    
    func getItems() -> [Description] {
        
        var itemsArray = [Description]()
        let itemsResults = realm.objects(Description.self)
        for eachItem in itemsResults {
            itemsArray.append(eachItem)
        }
        
        return itemsArray
    }
}
