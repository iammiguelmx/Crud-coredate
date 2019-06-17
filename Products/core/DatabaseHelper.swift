//
//  DatabaseHelper.swift
//  core
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static let shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save(object:[String:String]){
        
    let product  = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context) as! Products
        
        product.codigo = object["codigo"]
        product.producto = object["producto"]
        product.categoria = object["categoria"]
        product.precio = object["precio"]
        
        do{
            try context.save()
            print("done")
        }catch{
            print("Data not save \(error)")
        }
        
    }
    
    func getProductsData() -> [Products]{
        var product = [Products]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Products")
        
        do{
            product = try context.fetch(fetchRequest) as! [Products]
        }catch{
            print("Not get data \(error)")
        }
        return product
    }
    
    func deleteProduct(index:Int) ->[Products]{
        var product = getProductsData()
        context.delete(product[index])
        product.remove(at: index)
        
        do{
            try context.save()
        }catch {
            print("Error deleting data \(error)")
        }
        return product
    }
    
    func editProduct(object:[String:String], i: Int){
        var product = getProductsData()
        
        product[i].codigo = object["codigo"]
        product[i].producto = object["producto"]
        product[i].categoria = object["categoria"]
        product[i].precio = object["precio"]
       
        do{
            try context.save()
        }catch{
            print("Error updating data \(error)")
        }
    }
}
