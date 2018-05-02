import Foundation
import StepikCore

protocol SearchViewInput {
    func reloadData()
    func setupData(data: [PagedCourses.Course])
    func updateStoredItem(by index: Int, with icon: UIImage)
}
