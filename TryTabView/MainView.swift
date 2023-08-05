import SwiftUI
import ComposableArchitecture

struct MainView: View {

    let store: StoreOf<MainReducer>
    
    @State var selectedTabIndex = 0

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView(selection: $selectedTabIndex) {
                ForEach(viewStore.monthList.indices, id: \.self) { index in
                    let month = viewStore.monthList[index]
                    MainPageView(month: month).environment(\.layoutDirection, .leftToRight)
                }
            }.tabViewStyle(.page)
            .environment(\.layoutDirection, .rightToLeft)
            .onAppear {
                viewStore.send(.onAppear)
            }.onChange(of: selectedTabIndex) { newIndex in
                NSLog("newIndex = %d", newIndex)
                if(newIndex == 0) {
                    viewStore.send(.addPreviousPage)
                }
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
