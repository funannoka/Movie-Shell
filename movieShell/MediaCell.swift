//
//  MediaCell.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/9/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoTitleView: UIView!
    
    var desc = ""
    func setVideo(video: Video) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
        desc = video.desc
//        videoTitleView.isUserInteractionEnabled = true
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        videoTitleView.addGestureRecognizer(tapRecognizer)
    }
    
    func getVideo() -> Video {
        
        let video = Video(image: videoImageView.image ?? UIImage(), title: videoTitleLabel.text ?? "", desc: desc ?? "")
        
        
        return video
        
    }
    

    
}
