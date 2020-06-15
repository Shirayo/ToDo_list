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
    var favouritesTasksViewController = UINavigationController(rootViewController: FavouritesTasksViewController())
    var addTaskButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaskButton.center = CGPoint(x: tabBar.frame.width / 2, y: 10)
        setValue(CustomTabBar(frame: tabBar.frame), forKey: "tabBar")
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .black
        favouritesTasksViewController.tabBarItem = UITabBarItem(title: "favourites", image: UIImage(named: "star"), selectedImage: UIImage(named: "starblack"))
        tasksViewController.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(named: "task"), selectedImage: UIImage(named: "task black"))
        
        
        let tabBarList = [tasksViewController, favouritesTasksViewController]
        viewControllers = tabBarList
        
        view.addSubview(addTaskButton)
        setAddTaskButton()

    }

    func setAddTaskButton(isActive: Bool = true) {
        //constraints
        self.addTaskButton.translatesAutoresizingMaskIntoConstraints = false
        self.addTaskButton.widthAnchor.constraint(equalToConstant: self.view.frame.width / 5).isActive = isActive
        self.addTaskButton.heightAnchor.constraint(equalToConstant: self.view.frame.width / 5).isActive = isActive
        self.addTaskButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = isActive
        self.addTaskButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 30).isActive = isActive
        
        //visual
        self.addTaskButton.backgroundColor = .white
        self.addTaskButton.setImage(UIImage(named: "plus"), for: .normal)
        self.addTaskButton.tintColor = .gray
        self.addTaskButton.layer.cornerRadius = self.view.frame.width / 10
        self.addTaskButton.addTarget(self, action: #selector(goToAddTaskViewController), for: .touchUpInside)
    }
    
    @objc func goToAddTaskViewController() {
        self.present(AddTaskViewController(), animated: true, completion: nil)
    }
    
}
