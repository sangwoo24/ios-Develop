
import Foundation
import CoreData

class PersistenceManager{
    static var shared : PersistenceManager = PersistenceManager()
    
    var persistentContainer : NSPersistentContainer = {
       let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: {(storeDecription, error) in
            if let error = error as NSError?{
                fatalError("Unresolved error\(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context : NSManagedObjectContext{
        return self.persistentContainer.viewContext
    }
    
    func fetch<T : NSManagedObject>(request : NSFetchRequest<T>) -> [T]{
        do{
            let fetchResult = try self.context.fetch(request)
            return fetchResult
        } catch{
            print(error.localizedDescription)
            return []
        }
    }
    
    @discardableResult
    func insertMemo(memoList : [Memo]) -> Bool{
        let entity = NSEntityDescription.entity(forEntityName: "MemoList", in: context)
        
        if let entity = entity{
            let managedObject = NSManagedObject(entity: entity, insertInto: self.context)
            
            managedObject.setValue(memoList, forKey: "memolist")
            
            do {
                try self.context.save()
                return true
            } catch{
                print(error.localizedDescription)
                return false
            }
        } else {
            return false
        }
    }
    
    @discardableResult
    func delete(object : NSManagedObject) -> Bool{
        self.context.delete(object)
        do{
            try self.context.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func count<T : NSManagedObject>(request : NSFetchRequest<T>) -> Int?{
        do{
            let count = try self.context.count(for: request)
            return count
        } catch {
            return nil
        }
    }
}
