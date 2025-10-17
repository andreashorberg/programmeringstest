import Foundation

@Observable class ListViewModel {
    private let chuckService: ChuckService
    var viewState: ViewState = .idle
    var jokes: [ChuckJoke]

    init(chuckService: ChuckService) {
        self.chuckService = chuckService
        jokes = []
    }

    func didTapLoadButton() async {

    }

    private func loadJoke() async {
        do {
            let _ = try await chuckService.getRandomJoke()
            viewState = .loaded
        } catch {
            viewState = .error(error)
        }
    }

    enum ViewState {
        case idle
        case loaded
        case error(Error)
    }
}
