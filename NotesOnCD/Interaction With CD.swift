//
//  Interaction With CD.swift
//  NotesOnCD
//
//  Created by Леонид on 23.06.2021.
//

import UIKit
import CoreData

class CDManager {
    func takeDataFromEntity () -> [NSManagedObject] {
        var dataFromCD: [NSManagedObject] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return dataFromCD }
        //взятие теущего контекста (если обобщать – то область данных) приложения
        let managedContext = appDelegate.persistentContainer.viewContext
        //инициализация запроса в сущность
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
        do{
            dataFromCD = try managedContext.fetch(fetchRequest)
        } catch let error as NSError{
            //представляем алерт для информирования об ошибке взятия из сущности
        }
        return dataFromCD
    }
    
    func saveDataToEntity (_ createdNote: NoteModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)!
        
        let noteCD = NSManagedObject(entity: entity, insertInto: managedContext)
        
        noteCD.setValue(createdNote.noteName, forKey: "noteName")
        noteCD.setValue(createdNote.dateOfCreation, forKey: "dateOfCreation")
        noteCD.setValue(createdNote.note, forKey: "note")
        
        do{
            try managedContext.save()
            
        } catch let error as NSError {
            //TODO: добавить алерт с ошибкой
        }
    }
    
    func deleteNote (_ deletingNote: NSManagedObject) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        managedContext.delete(deletingNote)
        
        do{
            try managedContext.save()
            
        } catch let error as NSError {
            //TODO: добавить алерт с ошибкой
        }
    }
}
