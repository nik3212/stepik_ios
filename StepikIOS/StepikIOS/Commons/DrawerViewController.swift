import UIKit

enum ScreenType {
    case bookmarks
    case search
    
    static var all: [ScreenType] = [.bookmarks, .search]
    
    var title: String {
        switch self {
        case .bookmarks:
            return "Закладки"
        case .search:
            return "Поиск"
        }
    }
}
