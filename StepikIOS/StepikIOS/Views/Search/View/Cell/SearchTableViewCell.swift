import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet var courseImageView: UIImageView!
    @IBOutlet var nameCourseLabel: UILabel!
    @IBOutlet var bookmarkButton: UIButton!
    
    @IBOutlet var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupStyle()
    }
    
    private func setupStyle() {
        courseImageView.layer.cornerRadius = 10
        courseImageView.layer.masksToBounds = true
        
        backView.layer.cornerRadius = 10
        
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 0.2
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 3
    }
}
