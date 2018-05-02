import UIKit

enum ScreenType {
    case bookmarks
    case search
    
    static var all: [ScreenType] = [.bookmarks, .search]
    
    var title: String {
        switch self {
        case .bookmarks:
            return "Избранное"
        case .search:
            return "Курсы"
        }
    }
}
