import Foundation

struct YearMonth: Equatable, Hashable, Comparable {
    static func < (lhs: YearMonth, rhs: YearMonth) -> Bool {
        lhs.year * 100 + lhs.month < rhs.year * 100 + rhs.month
    }

    var year: Int
    var month: Int

    func previous() -> YearMonth {
        if month >= 2 {
            return YearMonth(year: year, month: month - 1)
        } else {
            return YearMonth(year: year - 1, month: 12)
        }
    }
}
