import Foundation

struct StorageService {
    private let key = "savedProgress"
    private let defaults = UserDefaults.standard
    
    func save(_ progress: SavedProgress) {
        guard let data = try? JSONEncoder().encode(progress) else { return }
        defaults.set(data, forKey: key)
        print("💾 Saved: \(progress.logs.count) logs, goal: \(progress.goal?.subject ?? "none")")
    }
    
    func load() -> SavedProgress? {
        guard let data = defaults.data(forKey: key) else {
            print("📭 Nothing saved yet")
            return nil
        }
        let progress = try? JSONDecoder().decode(SavedProgress.self, from: data)
        print("📂 Loaded: \(progress?.logs.count ?? 0) logs, goal: \(progress?.goal?.subject ?? "none")")
        return progress
        }
}

