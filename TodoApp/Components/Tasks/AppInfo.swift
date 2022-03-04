//
//  Navigation.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/04.
//

import SwiftUI

struct AppInfo: View {
    var body: some View {
        ZStack(alignment: .center) {
            Text("ToDo リスト")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
            Image(systemName: "person.circle")
                .font(.largeTitle)
                .frame(maxWidth:.infinity, alignment: .trailing)

        }
        .padding()


    }
}

struct AppInfo_Previews: PreviewProvider {
    static var previews: some View {
        AppInfo()
    }
}
