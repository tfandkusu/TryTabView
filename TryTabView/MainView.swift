import SwiftUI
import ComposableArchitecture

struct MainView: View {

    let store: StoreOf<MainReducer>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            let selection = viewStore.binding(get: \.selectedTab, send: MainReducer.Action.onPageSelected)
            TabView(selection: selection) {
                ForEach(viewStore.monthList, id: \.self) { month in
                    MainPageView(month: month).tag(month)
                }
            }.tabViewStyle(.page).onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            store: Store(
                initialState: MainReducer.State()
            ) {
            MainReducer()
          }
        )
    }
}
