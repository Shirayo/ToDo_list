//
//  ViewController.swift
//  Shirayo's_To_Do_List
//
//  Created by Shirayo on 08.05.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TaskTableViewDelegate {

    var completedTasks: [Task] = [Task("jepa", false)]
    var tasks: [Task] = [Task("jedkfmael;kgnergjnwergjnwe;rlkgnwe;lkrgn;welkrgnew;lkrnpa", false), Task("jepa", false), Task("jepa", false), Task("jepa", false)]
    
    let taskTableView = UITableView()
    
    override func viewDidLoad() {
        taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskTableViewCell")
        super.viewDidLoad()
        view.addSubview(taskTableView)
        autoLayoutForTableView()
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    
    func autoLayoutForTableView() {
        taskTableView.translatesAutoresizingMaskIntoConstraints = false
        taskTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        taskTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        taskTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        taskTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    }
    
    func addTask(text: String) {
        let task = Task(text)
        tasks.insert(task, at: 0)
        taskTableView.reloadData()
    }
    
    func updateTasks() {
        
    }
    
    func markButtonTapped(_ cell: TaskTableViewCell) {
        if let indexPath = taskTableView.indexPath(for: cell) {
            if cell.isCompletedButton.status {
                tasks.insert(completedTasks[indexPath.row], at: 0)
                taskTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
                
                completedTasks.remove(at: indexPath.row)
                taskTableView.deleteRows(at: [taskTableView.indexPath(for: cell)!], with: .fade)
            } else {
                completedTasks.append(tasks[indexPath.row])
                taskTableView.insertRows(at: [IndexPath(row: completedTasks.count - 1, section: 1)], with: .fade)
                tasks.remove(at: indexPath.row)
                taskTableView.deleteRows(at: [taskTableView.indexPath(for: cell)!], with: .fade)
            }
        }
        updateTasks()
    }
    
}


//MARK: extentions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        switch section {
            case 0:
                return tasks.count
            case 1:
                return completedTasks.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               switch indexPath.section {
               case 0:
                   tasks.remove(at: indexPath.row)
                   tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
               case 1:
                   completedTasks.remove(at: indexPath.row)
                    tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 1)], with: .fade)
               default:
                   print("heh")
               }
               updateTasks()
           }
       }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Tasks"
        case 1:
            return "Competed"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
           return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
           switch sourceIndexPath.section {
           case 0:
               let movedTask = tasks[sourceIndexPath.row]
               tasks.remove(at: sourceIndexPath.row)
               tasks.insert(movedTask, at: destinationIndexPath.row)
           case 1:
               let movedTask = completedTasks[sourceIndexPath.row]
               completedTasks.remove(at: sourceIndexPath.row)
               completedTasks.insert(movedTask, at: destinationIndexPath.row)
           default:
               print("How did you get there?")
           }
           //updateTasks()
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        switch indexPath.section {
            case 0:
                //cell.setTask(tasks[indexPath.row])
                cell.setTask(tasks[indexPath.row])
                cell.isCompletedButton.setStatus(false)
                cell.makeStrikeOutText(0)
                cell.createButtonAndTaskText()
            case 1:
                cell.setTask(completedTasks[indexPath.row])
                cell.isCompletedButton.setStatus(true)
                cell.makeStrikeOutText(2)
                cell.createButtonAndTaskText()
            default:
                print ("Something went wrong...")
        }
        cell.delegate = self
        return cell
    }
}


