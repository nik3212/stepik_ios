import Foundation

protocol SearchViewInput {
    func reloadData()
    func setupView(viewModel: SearchCellModel)
}
