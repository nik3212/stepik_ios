import UIKit
import CoreDataStack

class BookmarksViewConfigurator {
    private lazy var coreDataStack = CoreDataStack(modelName: "Courses")
    
    func configure<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? BookmarksViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: BookmarksViewController) {
        let presenter = BookmarksPresenter()
        
        presenter.view = viewController
        
        let viewModel = BookmarksCellModel()

        viewModel.coreDataWrapper = CoreDataWrapper(managedContext: coreDataStack.managedContext)
        
        viewController.output = presenter
        viewController.viewModel = viewModel
    }
}
