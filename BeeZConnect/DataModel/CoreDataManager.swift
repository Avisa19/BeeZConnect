

import UIKit
import CoreData


class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "BeeZConnect")
        container.loadPersistentStores { (persistentStorageContainer, err) in
            if let err = err {
                fatalError("failed to persist data: \(err)")
            }
        }
        return container
    }()
    
    
    func createData(id: Double, title: String, status: Bool) {
        let context = persistentContainer.viewContext
        
        let toDo = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: context)
        
        toDo.setValue(id, forKey: "id")
        toDo.setValue(title, forKey: "title")
        toDo.setValue(status, forKey: "status")
        
        do {
            try context.save()
        } catch let err {
            print("Failed to save Data: \(err)")
        }
    }
    
    func fetchData(title: String) -> ToDo? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
        var toDo: ToDo?
        do {
            let toDos = try context.fetch(fetchRequest)
            toDos.forEach { (fetchedToDo) in
                if fetchedToDo.title == title {
                    toDo = fetchedToDo
                }
            }
        } catch let err {
            print("Failed to fetch data: \(err)")
            
        }
        return toDo
    }
    
     func deleteToDos(id: Double) {
        
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
        
        do {
            
            let toDos = try context.fetch(fetchRequest)
            toDos.forEach { (fetchedToDo) in
                if fetchedToDo.id == id {
                    context.delete(fetchedToDo)
                }
            }
            
        } catch let err {
            print("Failed to fetch data from context: \(err)")
        }
    }
    
    func fetchData() -> [ToDo] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
        do {
            let toDos = try context.fetch(fetchRequest)
            return toDos
        } catch let err {
            print("Failed to fetch data: \(err)")
            return []
        }
    }
    
}
