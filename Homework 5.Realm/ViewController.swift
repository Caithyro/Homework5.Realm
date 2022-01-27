//
//  ViewController.swift
//  Homework 5.Realm
//
//  Created by Дмитрий Куприенко on 20.12.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var taskTwoTextField: UITextField!
    @IBOutlet weak var taskTwoTableview: UITableView!
    
    var shoppingList: [Description] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTwoTableview.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        self.shoppingList = DataManager().getItems()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textField = taskTwoTextField,
              let nameToSave = textField.text else {
                  return false
              }
        
        let alert = UIAlertController(title: "Item type and quantity",
                                      message: "Specify item type and quantity",
                                      preferredStyle: .alert)
        
        let saveButton = UIAlertAction(title: "Save", style: .default) { action in
            
            guard let textField = alert.textFields?.first,
                  let typeToSave = textField.text else {
                      return
                  }
            guard let textField1 = alert.textFields?.last,
                  let quantityToSave = textField1.text else {
                      return
                  }
            
            DataManager().saveItems(itemName: nameToSave, itemType: typeToSave, itemQuantity: quantityToSave)
            
            self.shoppingList = DataManager().getItems()
            self.taskTwoTableview.reloadData()
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.textFields?.first?.placeholder = "Type"
        alert.addTextField()
        alert.textFields?.last?.placeholder = "Quantity"
        
        alert.addAction(saveButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true)
        
        return true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = taskTwoTableview.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else { return UITableViewCell() }
        
        let dataToDisplay = self.shoppingList[indexPath.row]
        cell.setupCell(dataToDisplay: dataToDisplay)
        
        return cell
    }
    
    
}

