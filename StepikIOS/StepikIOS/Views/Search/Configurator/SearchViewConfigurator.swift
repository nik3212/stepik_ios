import UIKit

class SearchViewConfigurator {
    func configure<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? SearchViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: SearchViewController) {
        let presenter = SearchPresenter()
        
        presenter.view = viewController
        
        let viewModel = SearchCellModel()
        
        viewController.output = presenter
        viewController.viewModel = viewModel
    }
}
