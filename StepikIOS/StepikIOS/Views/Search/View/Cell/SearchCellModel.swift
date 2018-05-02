import UIKit
import StepikCore
import ExternalWorkers

class SearchCellModel {
    
    private var courses: [PagedCourses.Course] = []

    var coreDataWrapper: CoreDataWrapper!
    
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
        
        cell.bookmarkButton.isChecked = isExist(index: indexPath.row)
        
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, UIScreen.main.bounds.width)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func save(index: Int) {
        coreDataWrapper.save(course: courses[index])
    }
    
    func load() -> [Course] {
        return coreDataWrapper.load()
    }
    
    func remove(index: Int) {
        coreDataWrapper.remove(id: courses[index].id)
    }
    
    func isExist(index: Int) -> Bool {
        return coreDataWrapper.isExist(id: courses[index].id)
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
