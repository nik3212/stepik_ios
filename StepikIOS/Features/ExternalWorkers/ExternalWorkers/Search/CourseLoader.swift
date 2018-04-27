import StepikCore

public protocol CourseLoaderProtocol {
    func loadCourses(_ completion: @escaping (Result<PagedCourses>)->())
}

import Alamofire
protocol AlamofireResponcable {
    @discardableResult
    func response(queue: DispatchQueue?, completionHandler: @escaping (DefaultDataResponse) -> Void) -> Self
}

extension DataRequest: AlamofireResponcable {}
public class CourseLoader: CourseLoaderProtocol {
    var courseRequest: AlamofireResponcable = Alamofire.request(Constants.searchUrl + "1")
    
    public init() {}
    
    public func loadCourses(_ completion: @escaping (Result<PagedCourses>)->()) {
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
