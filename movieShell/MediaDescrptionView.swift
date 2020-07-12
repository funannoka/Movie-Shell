//
//  MediaView.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/11/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit
import AVKit
import Firebase

class MediaDescriptionView: UIViewController , UIGestureRecognizerDelegate{
   
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIImageView!
    
    var video = Video(image: UIImage(), title: "", desc: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        coverImage.image = video.image
        titleLabel.text = video.title
        descriptionText.text = video.desc
        playButton.isUserInteractionEnabled = true
         let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(playTapped))
        tapRecognizer.delegate = self
        playButton.addGestureRecognizer(tapRecognizer)
        
    }
    
    @objc func playTapped(sender: UIImageView)
    {
        //print("Play Tapped")
        if let path = Bundle.main.path(forResource: "1", ofType: "mp4")
        {
        
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer, animated: true, completion:
                {
                    video.play()
                })
        }
    }


//    func setVideo(video: Video) {
//            coverImage.image = video.image
//            titleLabel.text = video.title
//           // descriptionText.text = video.desc
//        }
   

}


