import UIKit

class MainPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    var pages = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self

        pages = [
            MonthViewController(month: YearMonth(year: 2023, month: 8)),
            MonthViewController(month: YearMonth(year: 2023, month: 7))
        ]

        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .reverse, animated: true, completion: nil)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return pages[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil
        }
        return pages[currentIndex + 1]
    }
}
