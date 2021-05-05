//
//  Copyright © 2021 SL. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    private let viewModel: ListViewModel

    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.stateUpdated = { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .idle: break
            case .needsUpdate:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .error: break
            }
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setup() {
        title = "Chuck Norris Jokes"
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            view.topAnchor.constraint(equalTo: tableView.topAnchor),
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
        ])
        addLoadJokeButton()
    }

    func addLoadJokeButton() {

    }

    @objc func didTapLoadJokeButton() {
        viewModel.didTapLoadButton()
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
