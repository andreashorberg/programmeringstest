//
//  Copyright © 2021 SL. All rights reserved.
//

import Foundation

class ListViewModel {
    private let chuckService: ChuckService
    var stateUpdated: ((ViewState) -> Void)?
    private var viewState: ViewState = .idle {
        didSet {
            stateUpdated?(viewState)
        }
    }


    init(chuckService: ChuckService) {
        self.chuckService = chuckService
        jokes = chuckService
            .getAllJokes()
            .sorted { $0.createdAt > $1.createdAt }
    }

    func didTapLoadButton() {
        
    }

    var jokes: [ChuckJoke] = []

    private func loadJoke() {
        chuckService.getRandomJoke { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let joke):
                self.jokes.append(joke)
                self.viewState = .needsUpdate
            case .failure(let error):
                self.viewState = .error(error)
            }
        }
    }

    enum ViewState {
        case idle
        case needsUpdate
        case error(Error)
    }
}
