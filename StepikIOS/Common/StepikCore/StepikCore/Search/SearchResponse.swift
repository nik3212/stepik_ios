import Foundation

public struct PagedCourses: Codable {

    public struct Meta: Codable {
        public let page: Int
        public let hasNext: Bool
        public let hasPrevious: Bool

        enum CodingKeys: String, CodingKey {
            case page = "page"
            case hasNext = "has_next"
            case hasPrevious = "has_previous"
        }
    }

    public struct Course: Codable {
        public let id: Int
        public let position: Int
        public let score: Double
        public let targetId: Int
        public let targetType: String
        public let course: Int
        public let courseOwner: Int
        public let courseAuthors: [Int]
        public let courseTitle: String
        public let courseSlug: String
        public let courseCover: String
        public let lesson: Int?
        public let lessonOwner: Int?
        public let lessonTitle: String?
        public let lessonSlug: String?
        public let lessonCoverUrl: String?
        public let step: Int?
        public let stepPosition: Int?
        public let comment: String?
        public let commentParent: String?
        public let commentUser: String?
        public let commentText: String?

        enum CodingKeys: String, CodingKey {
            case id = "id"
            case position = "position"
            case score = "score"
            case targetId = "target_id"
            case targetType = "target_type"
            case course = "course"
            case courseOwner = "course_owner"
            case courseAuthors = "course_authors"
            case courseTitle = "course_title"
            case courseSlug = "course_slug"
            case courseCover = "course_cover"
            case lesson = "lesson"
            case lessonOwner = "lesson_owner"
            case lessonTitle = "lesson_title"
            case lessonSlug = "lesson_slug"
            case lessonCoverUrl = "lesson_cover_url"
            case step = "step"
            case stepPosition = "step_position"
            case comment = "comment"
            case commentParent = "comment_parent"
            case commentUser = "comment_user"
            case commentText = "comment_text"
        }
    }

    public let meta: Meta
    public let courses: [Course]
    
    
    private enum CodingKeys: String, CodingKey {
        case meta
        case courses = "search-results"
    }
    
}

//fileprivate struct PagedCourses: Decodable {
//    struct Meta: Decodable {
//        public let page: Int
//        public let hasNext: Bool
//        public let hasPrev: Bool
//    }
//
//    struct Course: Decodable {
//        public let id: Int
//        public let position: Int
//        public let score: Int
//        public let targetId: Int
//        public let targetType: String
//        public let course: Int
//        public let courseOwner: Int
//        public let courseAuthors: [Int]
//        public let courseTitle: Int
//        public let courseSlug: Int
//        public let courseCover: String
//        public let lesson: String?
//        public let lessonOwner: String?
//        public let lessonTitle: String?
//        public let lessonSlug: String?
//        public let lessonCoverUrl: String?
//        public let step: Int?
//        public let stepPosition: Int?
//        public let comment: String?
//        public let commentParent: String?
//        public let commentUser: String?
//        public let commentText: String?
//    }
//
//    let meta: Meta
//    let courses: [Course]
//}
//
//public struct SearchResponse: Decodable {
//    public init(from decoder: Decoder) throws {
//        let resonse = try PagedCourses(from: decoder)
//
//        print("1")
//        print(resonse.courses[0].id)
//    }
//}

//extension PagedCourses.Meta: Decodable {
//    enum MetaKeys: String, CodingKey {
//        case page = "page"
//        case hasNext = "has_next"
//        case hasPrev = "has_previous"
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: MetaKeys.self)
//
//        let page: Int = try container.decode(Int.self, forKey: .page)
//        let hasNext: Bool = try container.decode(Bool.self, forKey: .hasNext)
//        let hasPrev: Bool = try container.decode(Bool.self, forKey: .hasPrev)
//
//
//        self.init(page: page,
//                  hasNext: hasNext,
//                  hasPrev: hasPrev)
//    }
//}
//
//extension PagedCourses.Course: Decodable {
//    enum CourseKeys: String, CodingKey {
//        case id = "id"
//        case position = "position"
//        case score = "score"
//        case targetId = "target_id"
//        case targetType = "target_type"
//        case course = "course"
//        case courseOwner = "course_owner"
//        case courseTitle = "course_title"
//        case courseSlug = "course_slug"
//        case courseCover = "course_cover"
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CourseKeys.self)
//        let id: Int = try container.decode(Int.self, forKey: .id)
//        let position: Int = try container.decode(Int.self, forKey: .position)
//        let score: Int = try container.decode(Int.self, forKey: .score)
//        let targetId: Int = try container.decode(Int.self, forKey: .targetId)
//        let targetType: String = try container.decode(String.self, forKey: .targetType)
//        let course: Int = try container.decode(Int.self, forKey: .course)
//        let courseOwner: Int = try container.decode(Int.self, forKey: .courseOwner)
//        let courseTitle: Int = try container.decode(Int.self, forKey: .courseTitle)
//        let courseSlug: Int = try container.decode(Int.self, forKey: .courseSlug)
//        let courseCover: String = try container.decode(String.self, forKey: .courseCover)
//
//        self.init(id: id,
//                  position: position,
//                  score: score,
//                  targetId: targetId,
//                  targetType: targetType,
//                  course: course,
//                  courseOwner: courseOwner,
//                  courseTitle: courseTitle,
//                  courseSlug: courseSlug,
//                  courseCover: courseCover)
//    }
//}
