//
//  AccountList.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/18/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Firebase

func signOut(){
    do {
        try Auth.auth().signOut()
        //NavigationLink(Destination: LandingView())
    } catch let signOutError as NSError {
        print("Error signing out: %a", signOutError)
    }
}

struct AccountList: View {
    
    var body: some View {
        //TabView{
            NavigationView {
                VStack{
                    Text("Manage Settings")
                        .frame( height: 100)
                        .font(Font.custom("copperplate", size: 20))
                        .foregroundColor(.gray)
                        List() {
                        NavigationLink(destination: AccountDetails()) {
                        AccountRow(image: Image(systemName: "gear"), text: "App Settings")
                        }
                        NavigationLink(destination: AccountDetails()) {
                        AccountRow(image: Image(systemName: "person.fill"), text: "Account")
                        }
                        NavigationLink(destination: AccountDetails()) {
                        AccountRow(image: Image(systemName: "questionmark.circle"), text: "Help")
                        }
                        
                        
                    }
                    .environment(\.defaultMinListRowHeight, 50)
                    .frame(height: 200)
                    NavigationLink(destination:
                       LandingView()) {
                    Text("Sign Out")
                    .font(Font.custom("copperplate", size: 20))
                    .foregroundColor(.gray)
                    }
                    .frame( height: 100)
                    .onTapGesture {
                       print("Tapped Nav")
                       do {
                           try Auth.auth().signOut()
                           //NavigationLink(Destination: LandingView())
                       } catch let signOutError as NSError {
                           print("Error signing out: %a", signOutError)
                       }
                    }
                    //Text("")
                    //.frame( height: 100)
                    
                    //Spacer()
                   // .navigationBarTitle(Text("Manage Settings"))

                }

            }
      //  }
    }
}

struct AccountList_Previews: PreviewProvider {
    static var previews: some View {
        AccountList()
    }
}

class ChildHostingController: UIHostingController<AccountList> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: AccountList());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
}
