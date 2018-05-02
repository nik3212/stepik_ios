import Foundation
import StepikCore

protocol SearchViewOutput {
    func prepareData()
    func update(course index: Int, icon: UIImage)
}
