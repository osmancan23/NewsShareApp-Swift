//
//  TabbarController.swift
//  NewsShareApp-Swift
//
//  Created by Osmancan Akagündüz on 12.07.2024.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTabs()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupTabs()  {
        let home = self.createTab(title: "Home", image: UIImage(systemName: "house"), vc: HomeViewController())
        let search = self.createTab(title: "Search", image: UIImage(systemName: "magnifyingglass"), vc: SearchViewController())
        let profile = self.createTab(title: "Profile", image: UIImage(systemName: "person"),
                                     vc: ProfileViewController())
        
        self.setViewControllers([home,search,profile], animated: true)
    }
    
    func createTab(title:String, image : UIImage?, vc: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image  = image
        
        return navigationController
    }

}
