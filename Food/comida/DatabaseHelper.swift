//
//  DatabaseHelper.swift
//
//


import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static let shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save(object:[String:String]){
        
        let food = NSEntityDescription.insertNewObject(forEntityName: "Foods", into: context) as! Foods
        
        food.mesa = object["mesa"]
        food.personas = object["personas"]
        food.mesero = object["mesero"]
        food.area = object["area"]
        
        do{
            try context.save()
            print("done")
        }catch{
            print("Data not save \(error)")
        }
        
    }
    
    func getFoodsData() -> [Foods] {
        
        var food = [Foods] ()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Foods")
        
        do{
            food = try context.fetch(fetchRequest) as! [Foods]
        }catch{
            print("Not get data \(error)")
        }
        return food
    }
    
    func deleteFood(index:Int) -> [Foods]{
        var food = getFoodsData()
        context.delete(food[index])
        food.remove(at: index)
        
        do{
            try context.save()
        }catch {
            print("Error deleting data \(error)")
        }
        return food
    }
    
    func editFood(object:[String:String], i: Int){
        var food = getFoodsData()
        food[i].mesa = object["mesa"]
        food[i].personas = object["personas"]
        food[i].mesero = object["mesero"]
        food[i].area = object["area"]
        
        do{
            try context.save()
        }catch{
            print("Error updating data \(error)")
        }
    }
}
