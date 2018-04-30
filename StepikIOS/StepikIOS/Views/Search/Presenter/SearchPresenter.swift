import Foundation
import StepikCore
import ExternalWorkers

class SearchPresenter: SearchViewOutput {
    var view: SearchViewController!
    
    func prepareData() {
        courseLoader.loadCourses(page: currentPage) { (response) in
            switch response {
            case .Success(let pagedCourses):
                self.setupData(pagedCourses)
            case .Error:
                break
            }
        }
    }
    
    private func setupData(_ pagedCourse: PagedCourses) {
        view.setupData(data: pagedCourse.courses)
        view.reloadData()
        
        if (pagedCourse.meta.hasNext) {
            currentPage += 1
        }
        
        print(currentPage)
    }
    
    private let courseLoader = CourseLoader()
    private var currentPage = 1
}
