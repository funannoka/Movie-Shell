//
//  ListViewCell.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/24/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setList(account: Account) {
        itemImageView.image = account.image
        titleLabel.text = account.title
        
    }

}
