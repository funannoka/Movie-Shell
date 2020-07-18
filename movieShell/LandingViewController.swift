//
//  LandingViewController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/12/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct LandingView: View {
    var body: some View {
        VStack{
        Text("movie shell")
            .foregroundColor(.init( red: 0.290, green: 2.110, blue: 1.890, opacity: 1))
            .font(Font.custom("black", size: 60))
            .shadow(color: .gray, radius: 2, x: -2, y: -2)
            .frame(height: 350)
            Spacer()
           // Button(action: T##() -> Void, label: T##() -> PrimitiveButtonStyleConfiguration.Label)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}


class LandingViewController: UIHostingController<LandingView> {

    @IBOutlet weak var titleLabel: UILabel!
   
    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: LandingView());
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "movie shell"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) {(timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        

        // Do any additional setup after loading the view.
    }
    
    
}

//class ChildHostingController2: UIHostingController<LandingView> {
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder,rootView: LandingView());
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // navigationItem.hidesBackButton = true
//    }
//}
