import Foundation
import ComposableArchitecture

struct MainReducer : Reducer {
    struct State : Equatable {
        var monthList = [YearMonth(year: 1,month: 1)]
        var selectedTab = 0
    }
    
    enum Action : Equatable {
        case onAppear
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .onAppear:
            var monthList = Array<YearMonth>()
            var current = YearMonth(year: 2017, month: 1)
            while current <= YearMonth(year: 2023, month: 8) {
                monthList.append(current)
                current = current.next()
            }
            state.monthList = monthList
            state.selectedTab = monthList.count - 1
            return .none
        }
    }
}
