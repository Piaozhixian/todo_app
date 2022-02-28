//
//  AddTaskAlert.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/02/28.
//

import SwiftUI

struct AddTaskAlert: View {
    @EnvironmentObject var userData: UserData
    @State var text = ""
    var body: some View {
        ZStack() {
            Rectangle()
                .foregroundColor(.white)
            VStack {
                Text("アラート")
                TextField("テキスト",text: $text)
                HStack {
                    Button("OK") {
                        self.userData.showAddTaskAlert.toggle()
                    }
                }
            }.padding()
    }
                .frame(width: 300, height: 180,alignment: .center)
                .cornerRadius(20).shadow(radius: 20)
        
    }
}

struct AddTaskAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskAlert()
    }
}
