import SwiftUI
import ComposableArchitecture

struct MainView: View {

    let store: StoreOf<MainReducer>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            GeometryReader { geometry in
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewStore.monthList.indices, id: \.self) { index in
                                let month = viewStore.monthList[index]
                                MainPageView(month: month).frame(width: geometry.size.width)
                                    .id(index)
                                    .onAppear {
                                        NSLog("onAppear %04d/%02d", month.year, month.month)
                                    }
                            }
                        }
                    }.task(id: viewStore.selectedTab) {
                        proxy.scrollTo(viewStore.selectedTab)
                    }
                }
            }
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
