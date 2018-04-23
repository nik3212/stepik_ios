import Foundation

class SearchViewControllerInitializer {
    static func load(viewController: SearchViewController) -> SearchViewController {
        let configurator = SearchViewConfigurator()
        configurator.configure(viewInput: viewController)
        return viewController
    }
}
