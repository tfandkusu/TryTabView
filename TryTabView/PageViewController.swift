import SwiftUI
import UIKit

// https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit
// そのまま
struct PageViewController: UIViewControllerRepresentable {
    var monthList: [YearMonth]

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        pageViewController.dataSource = context.coordinator
        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true
        )
    }

    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.monthList.map { UIHostingController(rootView: MainPageView(month: $0)) }
        }

        func pageViewController(
            _: UIPageViewController,
            viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
            // 左のページを開く
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                if let oldestMonth = parent.monthList.last {
                    let newMonth = oldestMonth.previous()
                    parent.monthList = parent.monthList + [newMonth]
                    controllers = controllers + [UIHostingController(rootView: MainPageView(month: newMonth))]
                }
            }
            return controllers[index + 1]
        }

        func pageViewController(
            _: UIPageViewController,
            viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
            // 右のページを開く
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return nil
            }
            return controllers[index - 1]
        }
    }
}
