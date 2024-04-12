//
//  ViewController.swift
//  3.1st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 4/4/24.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .black
        setTabBar()
    }
    
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: ComingViewController())
        let vc4 = UINavigationController(rootViewController: DownViewController())
        let vc5 = UINavigationController(rootViewController: MoreViewController())
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = #colorLiteral(red: 0.1063747928, green: 0.1063747928, blue: 0.1063747928, alpha: 1)
        self.tabBar.barTintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
//        self.tabBar.backgroundColor = #colorLiteral(red: 0.1063747928, green: 0.1063747928, blue: 0.1063747928, alpha: 1)
//        self.tabBar.barTintColor = .red
//        self.tabBar.unselectedItemTintColor = .blue       //선택되지 않은 탭바의 색상
        
        guard let tabBarItems = self.tabBar.items else {return}
        tabBarItems[0].image = UIImage(named: "Home")
        tabBarItems[1].image = UIImage(named: "search")
        tabBarItems[2].image = UIImage(named: "play")
        tabBarItems[3].image = UIImage(named: "down")
        tabBarItems[4].image = UIImage(named: "bar")

        tabBarItems[0].title = "Home"
        tabBarItems[1].title = "Search"
        tabBarItems[2].title = "Coming Soon"
        tabBarItems[3].title = "Downloads"
        tabBarItems[4].title = "more"

    }


}


