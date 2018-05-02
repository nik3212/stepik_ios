import UIKit

class BookmarksCellModel {
    var coreDataWrapper: CoreDataWrapper!
    
    func countItems() -> Int {
        return coreDataWrapper.load().count
    }
    
    func cellInstance(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let courses = coreDataWrapper.load()
        
        cell.nameCourseLabel.text = courses[indexPath.row].name
        
        if let data = courses[indexPath.row].icon,
            let image = UIImage(data: data) {
            cell.courseImageView.image = image
        }
        
        cell.bookmarkButton.isChecked = coreDataWrapper.isExist(id: Int(courses[indexPath.row].id))
        
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, UIScreen.main.bounds.width)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func remove(index: Int) {
        let courses = coreDataWrapper.load()
        coreDataWrapper.remove(id: Int(courses[index].id))
    }
}
