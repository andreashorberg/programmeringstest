//
//  Copyright © 2021 SL. All rights reserved.
//

import Foundation

class ListViewModel: ObservableObject {
    private let chuckService: ChuckService
    var viewState: ViewState = .idle
    var jokes: [ChuckJoke]

    init(chuckService: ChuckService) {
        self.chuckService = chuckService
        jokes = []
    }

    func didTapLoadButton() {

    }

    private func loadJoke() {
        chuckService.getRandomJoke { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let joke):
                self.viewState = .loaded
            case .failure(let error):
                self.viewState = .error(error)
            }
        }
    }

    enum ViewState {
        case idle
        case loaded
        case error(Error)
    }
}
