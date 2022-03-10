//
//  SmallAddButton.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/02.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Button(action: {
                // Do something
            }) {
                Image(systemName: "plus")
                        .frame(width: 60, height: 60)
                        .imageScale(.large)
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .overlay{
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.gray, lineWidth: 1)

                        }
                        .font(.largeTitle)
                        
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
