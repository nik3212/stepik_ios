import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var output: SearchViewOutput!
    var viewModel: SearchCellModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SearchTableViewCell.self)
    }
}

extension SearchViewController: SearchViewInput {
    func reloadData() {
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countItems()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellInstance(tableView, cellForRowAt: indexPath)
    }
}