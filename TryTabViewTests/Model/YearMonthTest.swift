@testable import TryTabView
import XCTest

final class YearMonthTest: XCTestCase {
    func testPreviousSameYear() throws {
        XCTAssertEqual(YearMonth(year: 2023, month: 2).previous(), YearMonth(year: 2023, month: 1))
    }

    func testPreviousPreviousYear() throws {
        XCTAssertEqual(YearMonth(year: 2023, month: 1).previous(), YearMonth(year: 2022, month: 12))
    }

    func testCompare() throws {
        XCTAssertLessThan(YearMonth(year: 2023, month: 1), YearMonth(year: 2023, month: 2))
        XCTAssertLessThan(YearMonth(year: 2022, month: 12), YearMonth(year: 2023, month: 1))
    }
}
