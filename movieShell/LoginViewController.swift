//
//  LoginViewController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/12/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "loginToHome", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
