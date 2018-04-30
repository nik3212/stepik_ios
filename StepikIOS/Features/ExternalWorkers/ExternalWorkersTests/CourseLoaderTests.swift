import XCTest
import Alamofire
import StepikCore

@testable import ExternalWorkers

class CourseLoaderTests: XCTestCase {
    
    private var courseLoader: CourseLoader!
    private var request: RequestMock!
    
    override func setUp() {
        super.setUp()
        setup()
    }
    
    override func tearDown() {
        free()
        super.tearDown()
    }
    
    func setup() {
        courseLoader = CourseLoader()
        request = RequestMock()
        courseLoader.courseRequest = request
    }
    
    func free() {
        courseLoader = nil
        request = nil
    }
    
    func testLoadCoursesWithValidDataMustCompleteWithCoursesArray() {
        tstLoad(with: testCourseText) { [weak self] (result) in
            self?.checkResultIsValid(result)
        }
    }
    
    private func tstLoad(with text: String?, completion: @escaping (ExternalWorkers.Result<PagedCourses>)->()) {
        request.dataString = text
        
        let exp = expectation(description: "Waiting response")
        courseLoader.loadCourses(page: 1) { (result) in
            completion(result)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 0.3)
    }
    
    private func checkResultIsValid(_ result: ExternalWorkers.Result<PagedCourses>) {
        if case .Success(let courses) = result {
            XCTAssertEqual(courses.courses.count, 2)
            XCTAssertEqual(courses.meta.page, 1)
        } else {
            XCTFail("Invalid parsing")
        }
    }
    
    private var testCourseText = """
    {
      "meta": {
        "page": 1,
        "has_next": true,
        "has_previous": false
      },
      "search-results": [
        {
          "id": 41528747,
          "position": 1,
          "score": 241.86053,
          "target_id": 3150,
          "target_type": "course",
          "course": 3150,
          "course_owner": 18316828,
          "course_authors": [
            18316828
          ],
          "course_title": "TOEFL vocabulary",
          "course_slug": "TOEFL-vocabulary-3150",
          "course_cover": "https://stepik.org/media/cache/images/courses/3150/cover/da674dcb4bf280cdbc722214cc86fe93.png",
          "lesson": null,
          "lesson_owner": null,
          "lesson_title": null,
          "lesson_slug": null,
          "lesson_cover_url": null,
          "step": null,
          "step_position": null,
          "comment": null,
          "comment_parent": null,
          "comment_user": null,
          "comment_text": null
        },
        {
           "id": 41646299,
           "position": 2,
           "score": 203.68282,
           "target_id": 67,
            "target_type": "course",
            "course": 67,
            "course_owner": 651763,
            "course_authors": [
                651763
            ],
            "course_title": "Программирование на Python",
            "course_slug": "Программирование-на-Python-67",
            "course_cover": "https://stepik.org/media/cache/images/courses/67/cover/cf7621ccee379e4bf27d7cd6927adf2a.png",
            "lesson": null,
            "lesson_owner": null,
            "lesson_title": null,
            "lesson_slug": null,
            "lesson_cover_url": null,
            "step": null,
            "step_position": null,
            "comment": null,
            "comment_parent": null,
            "comment_user": null,
            "comment_text": null
        }
      ]
    }
    """
}

extension CourseLoaderTests {
    class RequestMock: AlamofireResponcable {
        private var data: Data?
        
        var dataString: String? = nil {
            didSet {
                data = dataString?.data(using: .utf8)
            }
        }
        
        func response(queue: DispatchQueue?, completionHandler: @escaping (DefaultDataResponse) -> Void) -> Self {
            completionHandler(DefaultDataResponse(request: nil, response: nil, data: data, error: nil))
            return self
        }
    }
}
