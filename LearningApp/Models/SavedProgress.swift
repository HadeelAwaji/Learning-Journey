import Foundation

struct SavedProgress: Codable {
    let goal: LearningGoal?
    let logs: [DayLog]
    let streakStartDate: Date
    let lastActivityDate: Date?
    let activityBeforeToday: Date?
}
