//
//  SearchCollectionViewCell.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/27/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
   // var videoTitle = ""
    var desc = ""
    
    func setVideo(video: Video) {
        coverImageView.image = video.image
        titleLabel.text = video.title
        desc = video.desc
    }
    
    func getVideo() -> Video {
        
        let video = Video(image: coverImageView.image ?? UIImage(), title: titleLabel.text ?? "" , desc: desc )
        
        return video
    }
    
}
