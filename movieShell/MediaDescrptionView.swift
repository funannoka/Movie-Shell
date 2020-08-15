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

class MediaDescriptionView: UIViewController , UIGestureRecognizerDelegate {
   
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIImageView!
    @IBOutlet weak var titleBar: UINavigationItem!
    
    var video = Video(image: UIImage(), title: "", desc: "", mp4: "")
    let videoRef : StorageReference = Storage.storage().reference().child("videos")
    var path: URL!
    var flag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coverImage.image = video.image
        titleLabel.text = video.title
        titleBar.title = video.title
        descriptionText.text = video.desc
        //let detailFullsizeUrl  = "gs://movie-shell.appspot.com/videos/"
        let mp4Ref = videoRef.child(video.mp4)
    
        mp4Ref.downloadURL { (url, error) in
            if let error = error {
                print("error getting URL \(error.localizedDescription)")
                self.flag = false
            } else {
                self.path = url!.absoluteURL
                self.flag = true
            }
        }
        
        playButton.isUserInteractionEnabled = true
         let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(playTapped))
        tapRecognizer.delegate = self
        playButton.addGestureRecognizer(tapRecognizer)
        
    }
    
    @objc func playTapped(sender: UIImageView)
    {
       // let delimiter = "."
       // let token = video.mp4.components(separatedBy: delimiter)
        
        
//        if let path = Bundle.main.path(forResource: token[0], ofType: "mp4")
//        {
        if flag
        {
            let video = AVPlayer(url: path)
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer, animated: true)
            {
                () -> Void in
                videoPlayer.player?.play()
            }
//            present(videoPlayer, animated: true, completion:
//            {
//                video.play()
//            })
        }
//        }
    }


//    let avPlayerViewController = AVPlayerViewController()
//    var avPlayer:AVPlayer? = nil
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//          FIRStorage.storage().referenceForURL(detailFullsizeUrl).metadataWithCompletion { (metadata, error) in
//            if error != nil{
//                print("error getting metadata")
//            } else {
//                let downloadUrl = metadata?.downloadURL()
//                print(downloadUrl)
//
//                if downloadUrl != nil{
//                    self.avPlayer = AVPlayer(URL: downloadUrl!)
//                    self.avPlayerViewController.player = self.avPlayer
//                    print("downloadUrl obtained and set")
//                }
//            }
//        }
//    }
//
//    func handleGesture() {
//        print("handle gesture")
//        self.presentViewController(self.avPlayerViewController, animated: true) { () -> Void in
//            self.avPlayerViewController.player?.play()
//        }
//    }
//

}


