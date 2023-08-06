import SwiftUI
import ComposableArchitecture

struct MainView: View {

    var body: some View {
        PageViewController(pages: [
            MainPageView(month: YearMonth(year: 2023, month: 8)),
            MainPageView(month: YearMonth(year: 2023, month: 7)),
        ])
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
