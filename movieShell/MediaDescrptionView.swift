//
//  MediaView.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/11/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class MediaDescriptionView: UIViewController {
   
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var video = Video(image: UIImage(), title: "", desc: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        coverImage.image = video.image
        titleLabel.text = video.title
        descriptionText.text = video.desc
        // Do any additional setup after loading the view.
    }


//    func setVideo(video: Video) {
//            coverImage.image = video.image
//            titleLabel.text = video.title
//           // descriptionText.text = video.desc
//        }
   

}


