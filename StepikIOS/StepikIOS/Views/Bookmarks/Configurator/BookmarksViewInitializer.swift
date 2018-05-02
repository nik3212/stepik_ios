import Foundation

class BookmarksViewControllerInitializer {
    static func load(viewController: BookmarksViewController) -> BookmarksViewController {
        let configurator = BookmarksViewConfigurator()
        configurator.configure(viewInput: viewController)
        return viewController
    }
}
