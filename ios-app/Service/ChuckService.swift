//
//  Copyright © 2021 SL. All rights reserved.
//

import Foundation
import Combine

final class ChuckService {
    private let worker = ChuckWorker()
    private var jokes: Set<ChuckJoke> = []

    func getRandomJoke(completion: @escaping (Result<ChuckJoke, Error>) -> Void) {
        worker.getRandomJoke(completion: completion)
    }

    func saveJoke(_ joke: ChuckJoke) throws {
        jokes.insert(joke)
    }

    func getAllJokes() -> Set<ChuckJoke> {
        jokes
    }

    enum ChuckError: LocalizedError {
        case failed

        var errorDescription: String? {
            return "“It works on my machine” always holds true for Chuck Norris."
        }
    }
}
