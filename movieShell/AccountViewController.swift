//
//  AccountViewController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/22/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//
import UIKit

private let reuseIdentifier = "AccountListCell"

class AccountViewController: UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
  //  var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
    
    var accountItems: [Account] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountItems = createList()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AccountListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        
        //collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
       // var config = UICollectionLayoutListConfiguration(appearance:.insetGrouped)
       // config.backgroundColor = .systemPurple
       // collectionView.collectionViewLayout =UICollectionViewCompositionalLayout.list(using: config)
     
       // let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
       // let layout = UICollectionViewCompositionalLayout.list(using: configuration)
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
    

    
}

extension AccountViewController:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {



    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return accountItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let account = accountItems[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AccountListCell

        cell.setList(account: account)
        // Configure the cell

        return cell
    }


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {

    }
    */


}
