//
//  ContentView.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/02/14.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @StateObject var userData = UserData()
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
                .environmentObject(realmManager)
                .environmentObject(userData)
            
            SmallAddButton()
                .padding()
                .environmentObject(realmManager)
                .environmentObject(userData)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
