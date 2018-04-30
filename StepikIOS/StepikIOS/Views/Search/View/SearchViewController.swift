import UIKit
import StepikCore
import KRPullLoader

class SearchViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var refreshControl = UIRefreshControl()
    
    var output: SearchViewOutput!
    var viewModel: SearchCellModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SearchTableViewCell.self)
        tableView.separatorColor = UIColor.clear
        
        output.prepareData()

        setup()
    }
    
    private func setup() {
        let refreshView = KRPullLoadView()
        refreshView.delegate = self
        tableView.addPullLoadableView(refreshView, type: .loadMore)
    }
    
    func refresh() {
        output.prepareData()
    }
    
    private var finishedLoadingInitialTableCells = false
}

extension SearchViewController: KRPullLoadViewDelegate {
    func pullLoadView(_ pullLoadView: KRPullLoadView, didChangeState state: KRPullLoaderState, viewType type: KRPullLoaderType) {
        if type == .loadMore {
            switch state {
            case let .loading(completionHandler):
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.refresh()
                    completionHandler()
                }
            default: break
            }
            return
        }
    }
}

extension SearchViewController: SearchViewInput {
    func setupData(data: [PagedCourses.Course]) {
        self.viewModel.append(data)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellInstance(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var lastInitialDisplayableCell = false
        
        if viewModel.countItems() > 0 && !finishedLoadingInitialTableCells {
            if let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows,
                let lastIndexPath = indexPathsForVisibleRows.last, lastIndexPath.row == indexPath.row {
                lastInitialDisplayableCell = true
            }
        }
        
        if !finishedLoadingInitialTableCells {
            if lastInitialDisplayableCell {
                finishedLoadingInitialTableCells = true
            }

            cell.transform = CGAffineTransform(translationX: 0, y: cell.bounds.height / 2)
            cell.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0.05*Double(indexPath.row), options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
            }, completion: nil)
        }
    }
}
