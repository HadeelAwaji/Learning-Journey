import Foundation

struct StorageService {
    private let key = "savedProgress"
    private let defaults = UserDefaults.standard

    func save(_ progress: SavedProgress) {
        guard let data = try? JSONEncoder().encode(progress) else { return }
        defaults.set(data, forKey: key)
    }

    func load() -> SavedProgress? {
        guard let data = defaults.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(SavedProgress.self, from: data)
    }
}
