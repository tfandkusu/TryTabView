import Foundation
import ComposableArchitecture

struct MainReducer : Reducer {
    struct State : Equatable {
        var monthList = [YearMonth(year: 1,month: 1)]
        var selectedTab = 0
    }
    
    enum Action : Equatable {
        case onAppear
        case addPreviousPage
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .onAppear:
            state.monthList = [
                YearMonth(year: 2023, month: 7),
                YearMonth(year: 2023, month: 8),
            ]
            state.selectedTab = 1
            return .none
        case .addPreviousPage:
            let opticalLastPage = state.monthList.last
            if let lastPage = opticalLastPage {
                let newMonth = lastPage.previous()
                state.monthList =  state.monthList + [newMonth]
            }
            return .none
        }
    }

}
