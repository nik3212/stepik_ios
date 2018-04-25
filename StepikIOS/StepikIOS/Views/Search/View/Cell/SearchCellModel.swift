import UIKit
import StepikCore

class SearchCellModel {
    
    private var courses: [Course]?
    
    init(_ courses: [Course]?) {
        self.courses = courses
    }
    
    func countItems() -> Int {
        guard let courses = courses else { return 0 }
        return courses.count
    }
    
    func cellInstance(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        return cell
    }
}
