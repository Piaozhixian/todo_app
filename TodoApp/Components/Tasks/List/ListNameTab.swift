//
//  ListNameTab.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/04.
//

import SwiftUI

struct ListNameTab: View {
    var taskList: TaskList
    var showUnderScore: Bool = false
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack {
            Text(taskList.title)
                .frame(minWidth: 50)
                .onTapGesture {
                    self.setSelectedTaskList(taskList: taskList)
                }
            let color = showUnderScore ? Color.blue : Color.clear
            
            RoundedRectangle(cornerRadius: 30)
                .fill(color)
                .frame(maxWidth: .infinity, maxHeight: 3)
        }

    }
    
    
    func setSelectedTaskList(taskList: TaskList) {
        userData.selectedTaskList = taskList
    }
}

struct ListNameTab_Previews: PreviewProvider {
    static var previews: some View {
        ListNameTab(taskList: TaskList())
    }
}
