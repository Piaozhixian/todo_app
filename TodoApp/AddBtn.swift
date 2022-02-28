//
//  AddBtn.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/02/27.
//

import SwiftUI

struct FloatingButton: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack {  // --- 1
            Spacer()
            HStack { // --- 2
                Spacer()
                Button(action: {
                    self.userData.showAddTaskAlert.toggle()
                }, label: {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .font(.system(size: 24)) // --- 4
                })
                    .frame(width: 60, height: 60)
                    .background(Color.orange)
                    .cornerRadius(30.0)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0)) // --- 5

            }
        }
    }
}
