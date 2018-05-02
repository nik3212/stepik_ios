import Foundation

class BookmarksPresenter: BookmarksViewOutput {
    var view: BookmarksViewController!

    func remove(course index: Int) {
        view.remove(index: index)
    }
    
}
