import Foundation
import CoreData
import StepikCore

class CoreDataWrapper {
    private var managedContext: NSManagedObjectContext
    
    init (managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func save(course: PagedCourses.Course, icon: UIImage) {
        if isExist(id: course.id) { return }
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Course", in: managedContext)
        let managedObject = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
        
        managedObject.setValue(course.id, forKey: "id")
        managedObject.setValue(course.courseTitle, forKey: "name")
        
        guard let imageData = UIImageJPEGRepresentation(icon, 1) else { return }
        
        managedObject.setValue(imageData, forKey: "icon")
        
        do {
            try managedContext.save()
            print("Saved successfully")
        } catch let error as NSError {
            print("Save error: \(error), description: \(error.userInfo)")
        }
    }
    
    func load() -> [Course] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            
            return results as! [Course]
        } catch {
            print(error)
        }
        
        return []
    }
    
    func remove(id: Int) {
        let predicate = NSPredicate(format: "id == %@", argumentArray: [id])
        
        let request: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        request.predicate = predicate
        
        do {
            let results = try managedContext.fetch(request) as! [NSManagedObject]
            
            for result in results {
                managedContext.delete(result)
                try managedContext.save()
            }
        } catch {
            print(error)
        }
    }
    
    func isExist(id: Int) -> Bool {
        let predicate = NSPredicate(format: "id == %@", argumentArray: [id])
        
        let request: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Course")
        request.predicate = predicate
        
        do {
            let count = try managedContext.count(for: request)
            return count != 0
        } catch {
            print(error)
        }
        
        return false
    }
}
