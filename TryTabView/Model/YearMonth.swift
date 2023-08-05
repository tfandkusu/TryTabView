import Foundation

struct YearMonth : Equatable, Hashable {
    var year: Int
    var month: Int
    
    func previous() -> YearMonth {
        if(month >= 2) {
            return YearMonth(year: self.year, month: self.month - 1)
        }else {
            return YearMonth(year: self.year - 1, month: 12)
        }
    }
}
