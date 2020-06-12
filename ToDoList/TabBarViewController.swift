//
//  TabBarViewController.swift
//  ToDoList
//
//  Created by Shirayo on 11.06.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var tasksViewController = UINavigationController(rootViewController: MainViewController())
    var addTaskViewController = UINavigationController(rootViewController: AddTaskViewController())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(CustomTabBar(frame: tabBar.frame), forKey: "tabBar")

        //addTaskViewController = AddTaskViewController()
        addTaskViewController.tabBarItem = UITabBarItem(title: "favourites", image: UIImage(named: "star"), selectedImage: UIImage(named: "star black"))

        tasksViewController.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(named: "task"), selectedImage: UIImage(named: "task black"))
        //tasksViewController = MainViewController()
        
        let tabBarList = [tasksViewController, addTaskViewController]
        viewControllers = tabBarList
        // Do any additional setup after loading the view.
    }

}
