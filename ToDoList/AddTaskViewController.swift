//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Shirayo on 10.06.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITableViewDelegate {

    var createTaskTableView = UITableView()
    
    var taskCell: UITableViewCell = UITableViewCell()
    var datePicherCell: UITableViewCell = UITableViewCell()
    var addTaskCell: UITableViewCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(createTaskTableView)
        
        //self.addTaskButton.addTarget(self, action: #selector(), for: .touchUpInside)

    }
    func setConstraintsForTableView () {
        self.createTaskTableView.translatesAutoresizingMaskIntoConstraints = false
        self.createTaskTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.createTaskTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        createTaskTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        createTaskTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    }
}

//extension AddTaskViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//    
//}
