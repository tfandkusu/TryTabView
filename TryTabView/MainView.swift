import SwiftUI
import ComposableArchitecture

struct MainView: View {

    let store: StoreOf<MainReducer>
    
    @State var selectedTab = YearMonth(year: 1, month: 1)

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView(selection: $selectedTab) {
                ForEach(viewStore.monthList, id: \.self) { month in
                    MainPageView(month: month).tag(month)
                }
            }.tabViewStyle(.page).onAppear {
                viewStore.send(.onAppear)
            }.onChange(of: selectedTab) { newSelectedTab in
                viewStore.send(.onPageSelected(newSelectedTab))
            }.task(id: viewStore.selectedTab) {
                selectedTab = viewStore.selectedTab
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
