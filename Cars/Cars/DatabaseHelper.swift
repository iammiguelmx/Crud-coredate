//
//  DatabaseHelper.swift
//  core
//
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static let shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save(object:[String:String]){
        
        let car = NSEntityDescription.insertNewObject(forEntityName: "Cars", into: context) as! Cars
        
        car.modelo = object["modelo"]
        car.marca = object["marca"]
        car.transmision = object["transmision"]
        car.anio = object["anio"]
        
        do{
            try context.save()
            print("done")
        }catch{
            print("Data not save \(error)")
        }
        
    }
    
    func getCarsData() -> [Cars]{
        
        var car = [Cars]()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cars")
        
        do{
            car = try context.fetch(fetchRequest) as! [Cars]
        }catch{
            print("Not get data \(error)")
        }
        return car
    }
    
    func deleteCar(index:Int) ->[Cars]{
        var car = getCarsData()
        context.delete(car[index])
        car.remove(at: index)
        
        do{
            try context.save()
        }catch {
            print("Error deleting data \(error)")
        }
        return car
    }
    
    func editCar(object:[String:String], i: Int){
        var car = getCarsData()
        
        car[i].modelo = object["modelo"]
        car[i].marca = object["marca"]
        car[i].transmision = object["transmision"]
        car[i].anio = object["anio"]
        
        do{
            try context.save()
        }catch{
            print("Error updating data \(error)")
        }
    }
}
