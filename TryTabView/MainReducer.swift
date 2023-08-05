import Foundation
import ComposableArchitecture

struct MainReducer : Reducer {
    struct State : Equatable {
        var monthList = [YearMonth(year: 1,month: 1)]
        var selectedTab = YearMonth(year: 1,month: 1)
    }
    
    enum Action : Equatable {
        case onAppear
        case onPageSelected(YearMonth)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .onAppear:
            state.monthList = [
                YearMonth(year: 2023, month: 7),
                YearMonth(year: 2023, month: 8)
            ]
            state.selectedTab = YearMonth(year: 2023, month: 8)
            return .none
        case let .onPageSelected(month):
            NSLog("month = %04d/%02d",month.year, month.month)
            return .none
        }
    }

}
