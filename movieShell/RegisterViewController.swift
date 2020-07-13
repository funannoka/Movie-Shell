//
//  RegisterViewController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/12/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func registerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "registerToHome", sender: self)
        
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
