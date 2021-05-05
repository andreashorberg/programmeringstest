//
//  Copyright © 2021 SL. All rights reserved.
//

import Foundation
import Combine

final class ChuckWorker {
    private let host = "api.chucknorris.io"
    private let path = "/jokes/random"
    private let queryItems = [URLQueryItem(name: "category", value: "career")]
    private let scheme = "https"

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

    func getRandomJoke(completion: @escaping ((Result<ChuckJoke, Error>) -> Void)) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard
                error == nil,
                let data = data,
                let self = self
            else {
                completion(.failure(ChuckService.ChuckError.failed))
                return
            }

            do {
                let chuckJoke = try self.decodeJSON(data)
                completion(.success(chuckJoke))
            } catch {
                completion(.failure(ChuckService.ChuckError.failed))
            }
        }

        task.resume()
    }

    private func decodeJSON(_ data: Data) throws -> ChuckJoke {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try decoder.decode(ChuckJoke.self, from: data)
    }
}
