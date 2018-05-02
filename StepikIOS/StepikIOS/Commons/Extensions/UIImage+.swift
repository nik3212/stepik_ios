import UIKit

extension UIImage {
    enum Asset: String {
        case selectedCourse = "selectedStarButton"
        case unSelectedCourse = "starButton"
        
        var image: UIImage {
            return UIImage(asset: self)
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}
