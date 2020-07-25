//
//  ListViewController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/24/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit
import Firebase

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var reportLabel: UILabel!
    var accountItems: [Account] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "SHELL"
        //navigationItem.leftItemsSupplementBackButton = true
        navigationItem.hidesBackButton = true
        accountItems = createList()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
       // tableView.backgroundColor = UIColor.darkGray
        
       // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ListViewCell")
     
    }
    
    @IBAction func signOutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          //  reportLabel.text = signOutError.localizedDescription
            print(signOutError.localizedDescription)
        }
    }
    
    func createList() -> [Account] {
        var tempList: [Account] = []
        let gear = UIImage(systemName:"gear")
        let person = UIImage(systemName:"person.fill")
        let question = UIImage(systemName:"questionmark.circle")
        
        let acc1 = Account(image: gear ?? #imageLiteral(resourceName: "first"), title: "App Settings", subTitle: "")
        let acc2 = Account(image: person ?? #imageLiteral(resourceName: "first"), title: "Account", subTitle: "")
        let acc3 = Account(image: question ?? #imageLiteral(resourceName: "first"), title: "Help", subTitle: "")
        
        tempList.append(acc1)
        tempList.append(acc2)
        tempList.append(acc3)

        return tempList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let account = accountItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell", for: indexPath) as! ListViewCell
        cell.accessoryType = .disclosureIndicator
        cell.setList(account: account)
        //cell.addLayoutGuide()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  let cell = tableView.cellForRow(at: indexPath) as! ListViewCell
      //  self.tappedVideo = cell.getVideo()

        performSegue(withIdentifier: "accountToInfo", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let vc = segue.destination as! MediaDescriptionView
        //vc.video = self.tappedVideo
    }
    
    
    
}
