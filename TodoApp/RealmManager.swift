//
//  RealmManager.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/02.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    @Published private(set) var taskLists: [TaskList] = []

    init() {
        openRealm()
        getTasks()
        getTaskLists()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTasks()

                    print("Added new task to Realm: \(newTask)")
                }
            } catch {
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
            print(tasks)
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else { return }
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Updated task with id \(id)! Completed status: \(completed)")
                }
            } catch {
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else { return }

                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("Deleted task with id \(id)!")
                }            } catch {
                print("Error deleting task \(id) from Realm: \(error)")
            }
        }
    }
    
    func addTaskList(title: String) {
        
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newList = TaskList(value: ["title": title])
                    localRealm.add(newList)
                    getTaskLists()

                    print("Added new list to Realm: \(newList)")
                }
            } catch {
                print("Error adding list to Realm: \(error)")
            }
        }
    }
    
    func getTaskLists() {
        if let localRealm = localRealm {
            let allTaskLists = localRealm.objects(TaskList.self)
            taskLists = []
            allTaskLists.forEach { taskList in
                taskLists.append(taskList)
            }
        }
    }

    func getTaskListById(id: ObjectId) -> TaskList? {
        if let localRealm = localRealm {
            let results = localRealm.objects(TaskList.self).filter(NSPredicate(format: "id == %@", id))
            guard !results.isEmpty else { return nil }
            return results.first
        }
        return nil
    }
    
}
