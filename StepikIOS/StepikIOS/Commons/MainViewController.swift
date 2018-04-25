import UIKit

extension ScreenType {
    var viewController: UIViewController {
        switch self {
        case .bookmarks:
            break
        case .search:
            let searchVC = SearchViewControllerInitializer.load(viewController: ViewControllerFactory.instantiate(.Search) as SearchViewController)
            return searchVC
        }
        return UIViewController()
    }
}

class MainViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    @IBOutlet var tabBar: UITabBar!

    private var currentScreen: ScreenType = .search
    private var currentContentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillContent()
    }

    func updateContent(_ screen: ScreenType) {
        guard currentScreen != screen else { return }
        currentScreen = screen
        fillContent()
    }
    
    func fillContent() {
        removePrevious()
        addNewViewController()
    }

    private func addNewViewController() {
        let newVC = currentScreen.viewController
        addChildViewController(newVC)
        let newView = newVC.view!
        newView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(newView)
        view.addConstraint(NSLayoutConstraint(item: newView, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: newView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: newView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: newView, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        newVC.didMove(toParentViewController: self)
    }
    
    private func removePrevious() {
        if let currentVC = currentContentViewController {
            currentVC.willMove(toParentViewController: nil)
            currentVC.view.removeFromSuperview()
            currentVC.removeFromParentViewController()
            currentContentViewController = nil
        }
    }
}

extension MainViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Select")
    }
}

