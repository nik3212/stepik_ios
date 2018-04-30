import Foundation
import StepikCore

protocol SearchViewInput {
    func reloadData()
    func setupData(data: [PagedCourses.Course])
}
