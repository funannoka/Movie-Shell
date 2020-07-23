//
//  AccountListCell.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/22/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class AccountListCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setList(account: Account) {
        if imageView != nil {
            imageView.image = account.image
        }
        if titleLabel != nil {
            titleLabel.text = account.title
        }
    //      videoTitleView.isUserInteractionEnabled = true
    //      let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
    //        videoTitleView.addGestureRecognizer(tapRecognizer)
    }
    
}
