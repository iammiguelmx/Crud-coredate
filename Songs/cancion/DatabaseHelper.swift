//
//  DatabaseHelper.swift
//
//
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static let shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save(object:[String:String]){
        
        let song = NSEntityDescription.insertNewObject(forEntityName: "Songs", into: context) as! Songs
        
        song.nombre = object["nombre"]
        song.album = object["album"]
        song.artista = object["artista"]
        song.genero = object["genero"]
        
        do{
            try context.save()
            print("done")
        }catch{
            print("Data not save \(error)")
        }
        
    }
    
    func getSongsData() -> [Songs] {
        
        var song = [Songs] ()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Songs")
        
        do{
            song = try context.fetch(fetchRequest) as! [Songs]
        }catch{
            print("Not get data \(error)")
        }
        return song
    }
    
    func deleteSong(index:Int) -> [Songs]{
        var song = getSongsData()
        context.delete(song[index])
        song.remove(at: index)
        
        do{
            try context.save()
        }catch {
            print("Error deleting data \(error)")
        }
        return song
    }
    
    func editSong(object:[String:String], i: Int){
        var song = getSongsData()
        song[i].nombre = object["nombre"]
        song[i].album = object["album"]
        song[i].genero = object["genero"]
        song[i].artista = object["artista"]
        
        do{
            try context.save()
        }catch{
            print("Error updating data \(error)")
        }
    }
}
