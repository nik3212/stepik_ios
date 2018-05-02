import UIKit

class RadioButton: UIButton {

    let checkedImage = UIImage(asset: .selectedCourse)
    let uncheckedImage = UIImage(asset: .unSelectedCourse)
    
    var isChecked: Bool = false {
        didSet {
            if isChecked {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
