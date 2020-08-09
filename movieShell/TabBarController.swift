//
//  TabBarController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/26/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

protocol TabBarReselectHandling {
    func handleReselect()
}

class TabBarController: UITabBarController, UITabBarControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    
    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        if tabBarController.selectedViewController === viewController,
            let handler = viewController as? TabBarReselectHandling {
            // NOTE: viewController in line above might be a UINavigationController,
            // in which case you need to access its contents
            handler.handleReselect()
        }

        return true
    }

}

