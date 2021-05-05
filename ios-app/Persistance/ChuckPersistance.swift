//
//  Copyright © 2021 SL. All rights reserved.
//

import Foundation

final class ChuckPersistance {
    private var jokes = Set<ChuckJoke>()

    func save(_ joke: ChuckJoke) {
        assert(!jokes.contains(joke))
        jokes.insert(joke)
    }

    func allJokes() -> Set<ChuckJoke> {
        return jokes
    }
}
