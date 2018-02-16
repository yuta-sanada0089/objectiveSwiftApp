//
//  TabViewController.swift
//  Paged Tabs Example
//
//  Created by Merrick Sapsford on 04/05/2016.
//  Copyright © 2016 Merrick Sapsford. All rights reserved.
//

import Foundation
import UIKit
import MSSTabbedPageViewController.h
import ChildViewController.swift

class TabViewController: MSSTabbedPageViewController {

    let style: TabControllerStyle!
    
    //イニシャライザ(初期値)
    init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        style = TabControllerStyle(name: "Default", tabStyle: MSSTabStyleImage, sizingStyle: MSSTabSizingStyleSizeToFit, numberOfTabs: 6)
    }
    
    func viewDidLoad() {
        super.viewDidLoad()
        if navigationController.viewControllers.first == self {
            // only show styles option if initial screen
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Styles", style: .plain, target: self, action: Selector("showStylesScreen:"))
        }
    }

    func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarView.transitionStyle = (style?.transitionStyle)!
        tabBarView.tabStyle = (style?.tabStyle)!
        tabBarView.sizingStyle = style?.sizingStyle
        tabBarView.tabAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: .thin), NSForegroundColorAttributeName: UIColor.black, MSSTabTitleAlpha: 0.1]
        tabBarView.selectedTabAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: .medium), NSForegroundColorAttributeName: view.tintColor]
    }
    
    @objc func showStylesScreen(_ sender: Any) {
        performSegue(withIdentifier: "showStylesSegue", sender: self)
    }
    
    func viewControllers(for pageViewController: MSSPageViewController) -> [Any] {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewControllers = [AnyHashable]()
        for i in 0..<style?.numberOfTabs {
            let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "viewController1")
            viewControllers.append(viewController ?? UIViewController())
        }
        return viewControllers
    }

    func tabBarView(_ tabBarView: MSSTabBarView, populateTab tab: MSSTabBarCollectionViewCell, at index: Int) {
        let imageName = "tab\(Int(index + 1)).png"
        
        tab.image = UIImage(named: imageName)
        //    tab.title = pageName;
    }
}

