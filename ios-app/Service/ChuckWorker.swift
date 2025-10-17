import Foundation

final class ChuckWorker {
    private let host = "api.chucknorris.io"
    private let path = "/jokes/random"
    private let queryItems = [URLQueryItem(name: "category", value: "career")]
    private let scheme = "https"
    private var dataTask: Task<ChuckJoke, any Error>?
    private var cache: NetworkCache = .init()
    private var url: URL {
        var components = URLComponents()
        components.host = host
        components.path = path
        components.scheme = scheme
        components.queryItems = queryItems
        guard let url = components.url else {
            preconditionFailure("Invalid parameters")
        }
        return url
    }

    func getRandomJoke() async throws -> ChuckJoke {
        dataTask = Task { [self] in
            let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
            do {
                let chuckJoke = try self.decodeJSON(data)
                try Task.checkCancellation()
                cache.data[chuckJoke.id] = chuckJoke
                return chuckJoke
            } catch is CancellationError {
                throw ChuckError.taskCancelled
            } catch {
                throw ChuckError.failed
            }
        }

        guard let joke = try await dataTask?.value else {
            throw ChuckError.failed
        }
        return joke
    }

    private func decodeJSON(_ data: Data) throws -> ChuckJoke {
        dataTask?.cancel()
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(ChuckJoke.self, from: data)
    }
}

class NetworkCache {
    var data: [String: ChuckJoke] = [:]
}
