import StepikCore

public protocol CourseLoaderProtocol {
    func loadCourses(page: Int, _ completion: @escaping (Result<PagedCourses>)->())
}

import Alamofire
protocol AlamofireResponcable {
    @discardableResult
    func response(queue: DispatchQueue?, completionHandler: @escaping (DefaultDataResponse) -> Void) -> Self
}

extension DataRequest: AlamofireResponcable {}
public class CourseLoader: CourseLoaderProtocol {
    var courseRequest: AlamofireResponcable!
    
    public init() {}
    
    public func loadCourses(page: Int, _ completion: @escaping (Result<PagedCourses>)->()) {
        #if TESTS
        #else
            courseRequest = Alamofire.request(Constants.searchUrl + String(page))
        #endif
 
        courseRequest.response(queue: nil) { (response) in
            if let data = response.data,
                let courses = try? JSONDecoder().decode(PagedCourses.self, from: data) {
                completion(.Success(courses))
            } else {
                completion(.Error)
            }
        }
    }
}
