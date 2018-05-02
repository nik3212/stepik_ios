import UIKit

protocol SearchTableViewCellDelegate: class {
    func didBookmarksTap(_ cell: SearchTableViewCell)
}

class SearchTableViewCell: UITableViewCell {
    
    weak var delegate: SearchTableViewCellDelegate?
    
    @IBOutlet var courseImageView: UIImageView!
    @IBOutlet var nameCourseLabel: UILabel!
    @IBOutlet var bookmarkButton: RadioButton!
    
    @IBOutlet var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupStyle()
    }
    
    private func setupStyle() {
        backView.layer.cornerRadius = 2
        
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 0.2
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 3
    }
}

extension SearchTableViewCell {
    @IBAction func addBookmark(_ sender: Any) {
        delegate?.didBookmarksTap(self)
    }
}
