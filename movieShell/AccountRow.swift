//
//  AccountRow.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/18/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import SwiftUI

struct AccountRow: View {
    var image = Image(systemName: "image")
    var text = ""

    var body: some View {
        HStack{
            image
                .resizable()
                .frame(width: 20, height: 20)
            .foregroundColor(.gray)
            Text(text)
                .font(Font.custom("copperplate", size: 20))
                .foregroundColor(.gray)
            Spacer()
        }.frame(width: 375, height: 50) //width: 400,
    }
}

struct AccountRow_Previews: PreviewProvider {
    
    static var previews: some View {
       // let rowIcon = Image(systemName: "gear")
      //  let rowText = "App Settings"
        Group {
            AccountRow(image: Image(systemName: "gear"), text: "App Settings")
            AccountRow(image: Image(systemName: "person.fill"), text: "Account")
            AccountRow(image: Image(systemName: "questionmark.circle"), text: "Help")
        }
        .previewLayout(.fixed(width: 400, height: 70))
    }
}
