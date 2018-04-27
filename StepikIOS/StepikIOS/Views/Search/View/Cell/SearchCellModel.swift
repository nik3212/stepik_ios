import UIKit
import StepikCore

class SearchCellModel {
    
    private var pagedCourses: PagedCourses?
    
    init(_ pagedCourses: PagedCourses?) {
        self.pagedCourses = pagedCourses
    }
    
    func countItems() -> Int {
        guard let pagedCourses = pagedCourses else { return 0 }
        return pagedCourses.courses.count
    }
    
    func cellInstance(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        return cell
    }
}
