import SwiftUI

struct MainView: View {
    let monthList = [
        YearMonth(year: 2023, month: 6),
        YearMonth(year: 2023, month: 7),
        YearMonth(year: 2023, month: 8),
    ]
    @State private var selectedTab = YearMonth(year: 2023, month: 8)

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(monthList, id: \.self) { month in
                MainPageView(month: month).tag(month)
            }
        }.tabViewStyle(.page)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
