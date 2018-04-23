import UIKit

extension UIImage {
    enum Asset: String {
        case mainIcon = "mainicon"
        
        var image: UIImage {
            return UIImage(asset: self)
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}
