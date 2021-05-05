//
//  Copyright © 2021 SL. All rights reserved.
//

import Foundation
import Combine

final class ChuckService {
    private let persistance: ChuckPersistance
    private let worker = ChuckWorker()
    let randomJokeSubject = CurrentValueSubject<ChuckJoke?, ChuckError>(nil)

    init(persistance: ChuckPersistance) {
        self.persistance = persistance
    }

    func getRandomJoke(completion: ((Result<ChuckJoke, Error>) -> Void)?) {
        worker.getRandomJoke(completion: completion, subject: randomJokeSubject)
    }

    func saveJoke(_ joke: ChuckJoke) throws {
        persistance.save(joke)
    }

    func getAllJokes() -> Set<ChuckJoke> {
        persistance.allJokes()
    }

    enum ChuckError: LocalizedError {
        case failed

        var errorDescription: String? {
            return "“It works on my machine” always holds true for Chuck Norris."
        }
    }
}
