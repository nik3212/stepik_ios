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
        setupStyle()
    }
    
    private func setupStyle() {
        tableView.backgroundColor = .backgroundGray
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
    
    func updateStoredItem(by index: Int) {
        if viewModel.isExist(index: index) {
            viewModel.remove(index: index)
        } else {
            viewModel.save(index: index)
        }
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
        let cell = viewModel.cellInstance(tableView, cellForRowAt: indexPath) as! SearchTableViewCell
        cell.delegate = self
        return cell
    }
}

extension SearchViewController: SearchTableViewCellDelegate {
    func didBookmarksTap(_ cell: SearchTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            output.update(course: indexPath.row)
        }
    }
}
