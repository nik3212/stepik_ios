import Foundation
import ExternalWorkers

class SearchPresenter: SearchViewOutput {
    var view: SearchViewController!
    
    func prepareData() {
        courseLoader.loadCourses { (response) in
            switch response {
            case .Success(let courses):
                let viewModel = SearchCellModel(courses)
                self.view.setupView(viewModel: viewModel)
            case .Error:
                break
            }
        }
    }
    
    private let courseLoader = CourseLoader()
}
