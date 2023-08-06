import SwiftUI
import ComposableArchitecture

@main
struct TryTabViewApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(
                store: Store(
                    initialState: MainReducer.State()
                ) {
                    MainReducer()
                }
            )
        }
    }
}
