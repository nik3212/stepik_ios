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

extension PagedCourses.Course: Equatable {
    public static func == (lhs: PagedCourses.Course, rhs: PagedCourses.Course) -> Bool {
        return lhs.id == rhs.id
    }
}
