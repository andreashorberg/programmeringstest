import Foundation
import Combine

final class ChuckService: Sendable {
    private let worker: ChuckWorker
    private var workerFactory: (() -> ChuckWorker)?

    init() {
        self.worker = .init()

        self.workerFactory = {
            self.worker
        }
    }

    func getRandomJoke() async throws -> any Joke {
        return try await worker.getRandomJoke()
    }
}
