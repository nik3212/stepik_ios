import Foundation

class BookmarksPresenter: BookmarksViewOutput {
    var view: BookmarksViewController!

    func remove(course index: Int) {
        view.remove(index: index)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.view.reloadData()
        }
    }
    
}
