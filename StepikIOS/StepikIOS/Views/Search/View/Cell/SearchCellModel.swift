import UIKit

class SearchCellModel {
    
    func countItems() -> Int {
        return 0
    }
    
    func cellInstance(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        return cell
    }
}
