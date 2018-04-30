import UIKit

extension UIColor {
    static func fromRGB(_ r: Int, _ g: Int, _ b: Int) -> UIColor {
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
}

extension UIColor {
    @nonobjc class var backgroundGray: UIColor { return UIColor.fromRGB(248, 248, 248) }
}
