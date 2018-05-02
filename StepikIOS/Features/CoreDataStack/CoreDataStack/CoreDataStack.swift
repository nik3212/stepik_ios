import CoreData

public class CoreDataStack {
    private let modelName: String
    
    public init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeCoordinator: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public lazy var managedContext: NSManagedObjectContext = {
        return self.storeCoordinator.viewContext
    }()
    
    public func saveContext() {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}
