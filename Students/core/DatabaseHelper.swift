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
        
    let student = NSEntityDescription.insertNewObject(forEntityName: "Students", into: context) as! Students
        
        student.codigo = object["codigo"]
        student.direccion = object["direccion"]
        student.especialidad = object["especialidad"]
        student.nombre = object["nombre"]
        student.telefono = object["telefono"]
        
        do{
            try context.save()
            print("done")
        }catch{
            print("Data not save \(error)")
        }
        
    }
    
    func getStundetsData() -> [Students]{
        var student = [Students]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Students")
        
        do{
            student = try context.fetch(fetchRequest) as! [Students]
        }catch{
            print("Not get data \(error)")
        }
        return student
    }
    
    func deleteStundet(index:Int) ->[Students]{
        var student = getStundetsData()
        context.delete(student[index])
        student.remove(at: index)
        
        do{
            try context.save()
        }catch {
            print("Error deleting data \(error)")
        }
        return student
    }
    
    func editStundet(object:[String:String], i: Int){
        var student = getStundetsData()
        
        student[i].codigo = object["codigo"]
        student[i].direccion = object["direccion"]
        student[i].especialidad = object["especialidad"]
        student[i].nombre = object["nombre"]
        student[i].telefono = object["telefono"]
       
        do{
            try context.save()
        }catch{
            print("Error updating data \(error)")
        }
    }
}
