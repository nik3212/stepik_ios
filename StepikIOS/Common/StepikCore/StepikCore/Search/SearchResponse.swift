import Foundation

public struct Course {
    public let id: Int
    public let position: Int
    public let score: Int
    public let targetId: Int
    public let targetType: String
    public let course: Int
    public let courseOwner: Int
    public let courseTitle: Int
    public let courseSlug: Int
    public let courseCover: String
}

extension Course: Decodable {
    enum CourseKeys: String, CodingKey {
        case id = "id"
        case position = "position"
        case score = "score"
        case targetId = "target_id"
        case targetType = "target_type"
        case course = "course"
        case courseOwner = "course_owner"
        case courseTitle = "course_title"
        case courseSlug = "course_slug"
        case courseCover = "course_cover"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CourseKeys.self)
        let id: Int = try container.decode(Int.self, forKey: .id)
        let position: Int = try container.decode(Int.self, forKey: .position)
        let score: Int = try container.decode(Int.self, forKey: .score)
        let targetId: Int = try container.decode(Int.self, forKey: .targetId)
        let targetType: String = try container.decode(String.self, forKey: .targetType)
        let course: Int = try container.decode(Int.self, forKey: .course)
        let courseOwner: Int = try container.decode(Int.self, forKey: .courseOwner)
        let courseTitle: Int = try container.decode(Int.self, forKey: .courseTitle)
        let courseSlug: Int = try container.decode(Int.self, forKey: .courseSlug)
        let courseCover: String = try container.decode(String.self, forKey: .courseCover)
        
        self.init(id: id,
                  position: position,
                  score: score,
                  targetId: targetId,
                  targetType: targetType,
                  course: course,
                  courseOwner: courseOwner,
                  courseTitle: courseTitle,
                  courseSlug: courseSlug,
                  courseCover: courseCover)
    }
}
