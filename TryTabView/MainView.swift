import SwiftUI
import ComposableArchitecture

struct MainView: View {

    let store: StoreOf<MainReducer>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView {
                ForEach(viewStore.monthList.indices, id: \.self) { index in
                    let month = viewStore.monthList[index]
                    MainPageView(month: month).environment(\.layoutDirection, .leftToRight).onAppear {
                        NSLog("onAppear %d", index)
                    }
                }
            }.tabViewStyle(.page)
            .environment(\.layoutDirection, .rightToLeft)
            .onAppear {
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
