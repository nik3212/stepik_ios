import UIKit
import CoreDataStack

class SearchViewConfigurator {
    private lazy var coreDataStack = CoreDataStack(modelName: "Courses")
    
    func configure<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? SearchViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: SearchViewController) {
        let presenter = SearchPresenter()
        
        presenter.view = viewController

        let viewModel = SearchCellModel()
        
        //viewModel.managedContext = coreDataStack.managedContext
        viewModel.coreDataWrapper = CoreDataWrapper(managedContext: coreDataStack.managedContext)
        
        viewController.output = presenter
        viewController.viewModel = viewModel
    }
}
