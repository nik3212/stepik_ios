import UIKit
import EmptyDataSet_Swift

class BookmarksViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var output: BookmarksViewOutput!
    var viewModel: BookmarksCellModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        
        tableView.tableFooterView = UIView()
        
        tableView.register(SearchTableViewCell.self)
        
        tableView.dataSource = self
        
        setupStyle()
    }
    
    private func setupStyle() {
        tableView.backgroundColor = .backgroundGray
    }
}

extension BookmarksViewController: BookmarksViewInput {
    func reloadData() {
        tableView.reloadData()
    }

    func remove(index: Int) {
        viewModel.remove(index: index)
    }
}

extension BookmarksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.cellInstance(tableView, cellForRowAt: indexPath) as! SearchTableViewCell
        cell.delegate = self
        return cell
    }
}

extension BookmarksViewController: SearchTableViewCellDelegate {
    func didBookmarksTap(_ cell: SearchTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            output.remove(course: indexPath.row)
        }
    }
}

extension BookmarksViewController: EmptyDataSetDelegate {
    
}

extension BookmarksViewController: EmptyDataSetSource {
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Нет закладок"
        let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Нажмите кнопку ниже, чтобы добавить первую закладку."
        let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(asset: .emptyBookmarks)
    }
}
