import SwiftUI

struct MainPageView: View {
    var month: YearMonth

    var body: some View {
        VStack(alignment: .leading) {
            let text = String(format: "%04d/%02d", month.year, month.month)
            HStack {
                Text(text).font(.title)
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(month: YearMonth(year: 2023, month: 8))
    }
}
