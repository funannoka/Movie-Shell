//
//  LandingView.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/18/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct LandingView: View {
    var titleText = Text("movie shell")
    var loginButton = Button("Log In", action: {
    })
    var registerButton = Button("Register", action: {
        //performSegue(withIdentifier: "landingToLogin", sender: nil)
    })
    
    var body: some View {
        VStack{
        titleText
            .foregroundColor(.init( red: 0.290, green: 2.110, blue: 1.890, opacity: 1))
            //.font(Font.system(.headline, design: .default ))
            .font(Font.custom("default", size: 50))
            .shadow(color: .gray, radius: 2, x: -2, y: -2)
            .frame(height: 350)
            Spacer()
        loginButton.frame(height: 40)
        registerButton.frame(height: 40)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}


class LandingViewController: UIHostingController<LandingView> {

   // @IBOutlet weak var titleLabel: UILabel!
   
    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: LandingView());
    }
    
    var vc = LandingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vc.titleText = Text("")
        var charIndex = 0.0
        let titleText = "movie shell"
        var titleLabel = ""
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) {(timer) in
                titleLabel.append(letter)
                self.vc.titleText = Text(titleLabel)
            }
            charIndex += 1
        }
        

        // Do any additional setup after loading the view.
    }
    
    
}
