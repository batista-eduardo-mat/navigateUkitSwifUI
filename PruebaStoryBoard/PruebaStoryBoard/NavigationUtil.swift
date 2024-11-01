//
//  UIViewControllerKey.swift
//  PruebaStoryBoard
//
//  Created by David Eduardo Batista on 01/11/24.
//

import SwiftUI
import UIKit

struct NavigationUtil {
    
    static func popToViewController<T: UIViewController>(ofType type: T.Type, animated: Bool = false) {
        guard let rootViewController = UIApplication.shared.connectedScenes
            .compactMap({ ($0 as? UIWindowScene)?.keyWindow?.rootViewController }).first else {
            return
        }
        
        dismissPresentedControllers(viewController: rootViewController) {
            if let navigationController = findNavigationController(viewController: rootViewController),
               let targetViewController = findViewController(ofType: type, in: navigationController) {
                navigationController.popToViewController(targetViewController, animated: animated)
            }
        }
    }

    // Dismiss all presented controllers recursively
    private static func dismissPresentedControllers(viewController: UIViewController, completion: @escaping () -> Void) {
        if let presented = viewController.presentedViewController {
            presented.dismiss(animated: true) {
                dismissPresentedControllers(viewController: viewController, completion: completion)
            }
        } else {
            completion()
        }
    }
    
    private static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UITabBarController {
            return findNavigationController(viewController: navigationController.selectedViewController)
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            if let navController = findNavigationController(viewController: childViewController) {
                return navController
            }
        }
        
        return nil
    }
    
    private static func findViewController<T: UIViewController>(ofType type: T.Type, in navigationController: UINavigationController) -> T? {
        return navigationController.viewControllers.first(where: { $0 is T }) as? T
    }
}
