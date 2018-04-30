import UIKit
import StepikCore
import ExternalWorkers

class SearchCellModel {
    
    private var courses: [PagedCourses.Course] = []
    
    init(_ courses: [PagedCourses.Course] = []) {
        self.courses = courses
    }
    
    func append(_ courses: [PagedCourses.Course]) {
        for course in courses {
            if !self.courses.contains(where: { $0 == course }) {
                self.courses.append(course)
            }
        }
    }
    
    func countItems() -> Int {
        return courses.count
    }
    
    func cellInstance(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        cell.nameCourseLabel.text = courses[indexPath.row].courseTitle
        loadCourseImage(url: courses[indexPath.row].courseCover, to: cell)
        
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, UIScreen.main.bounds.width)
        cell.selectionStyle = .none
        
        return cell
    }
    
    private func loadCourseImage(url: String, to cell: SearchTableViewCell) {
        ImageLoader.loadImage(url: url) { (response) in
            switch (response) {
            case .Success(let image):
                cell.courseImageView.image = image
            case .Error:
                break
            }
        }
    }
}
