//
//  SmallAddButton.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/02.
//

import SwiftUI

struct SmallAddButton: View {
    @StateObject var realmManager = RealmManager()
    @StateObject var userData = UserData()
    @State private var isShowingView: Bool = false
    var body: some View {
        ZStack {
            Button(action: {
                // Do something
                isShowingView.toggle()
            }) {
                Image(systemName: "plus")
                        .frame(width: 60, height: 60)
                        .imageScale(.large)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(
                            Circle()
                        )
                        .font(.title)
            }
            .sheet(isPresented: $isShowingView) {
                AddTaskView()
                    .environmentObject(realmManager)
                    .environmentObject(userData)
            }

        }
        .frame(height: 50)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
