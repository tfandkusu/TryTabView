import XCTest
@testable import TryTabView

final class YearMonthTest: XCTestCase {
    
    func testPreviousSameYear() throws {
        XCTAssertEqual(YearMonth(year: 2023, month: 2).previous(), YearMonth(year: 2023, month: 1))
    }
    
    func testPreviousPreviousYear() throws {
        XCTAssertEqual(YearMonth(year: 2023, month: 1).previous(), YearMonth(year: 2022, month: 12))
    }
}
