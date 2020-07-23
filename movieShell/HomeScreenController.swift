//
//  HomeScreenController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/9/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit
import Firebase

class HomeScreenController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
   
    var videos: [Video] = []
    var tappedVideo = Video(image: UIImage(), title: "", desc: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videos = createArray()
        tableView.delegate = self
        tableView.dataSource = self
       // setUpFooter()
    }
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }
    
    func createArray() -> [Video] {
        var tempVideos: [Video] = []
        
        let video1 = Video(image: #imageLiteral(resourceName: "1"), title: "FUN HOME", desc: "This is the movie description about a movie that never existed but could, lol!\n Starring: My Cat and her attitude")
        let video2 = Video(image: #imageLiteral(resourceName: "2"), title: "SAD MAN", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video3 = Video(image: #imageLiteral(resourceName: "3"), title: "WEEP FOR MERCY", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video4 = Video(image: #imageLiteral(resourceName: "4"), title: "ALONE IN PARADISE", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video5 = Video(image: #imageLiteral(resourceName: "5"), title: "DEATH BY PEANUT", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video6 = Video(image: #imageLiteral(resourceName: "6"), title: "HOPELESS", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video7 = Video(image: #imageLiteral(resourceName: "7"), title: "NEED A FRIEND", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video8 = Video(image: #imageLiteral(resourceName: "8"), title: "THIRST", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video9 = Video(image: #imageLiteral(resourceName: "9"), title: "A DESPERATE MAN", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video10 = Video(image: #imageLiteral(resourceName: "10"), title: "PISSED OFF", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video11 = Video(image: #imageLiteral(resourceName: "11"), title: "DEEDS & DOOMS", desc: "This is the movie description about a movie that never existed but could, lol!")
        let video12 = Video(image: #imageLiteral(resourceName: "12"), title: "HUMANITY", desc: "This is the movie description about a movie that never existed but could, lol!")
        
        tempVideos.append(video1)
        tempVideos.append(video2)
        tempVideos.append(video3)
        tempVideos.append(video4)
        tempVideos.append(video5)
        tempVideos.append(video6)
        tempVideos.append(video7)
        tempVideos.append(video8)
        tempVideos.append(video9)
        tempVideos.append(video10)
        tempVideos.append(video11)
        tempVideos.append(video12)

        
        return tempVideos
    }
    
    
    @IBAction func watchThisTapped(_ sender: UIButton) {
       // performSegue(withIdentifier: "toMovieSeque", sender: self)

    }
    
//    func setUpFooter () {
//        MediaFooterView().isUserInteractionEnabled = true
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        MediaFooterView().addGestureRecognizer(tapRecognizer)
//    }
//
//    @objc func viewTapped(sender: UIView) {
//       let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//       let nextViewController = storyBoard.instantiateViewController(withIdentifier: "toMovieSeque") as! MediaDescriptionView
//       self.present(nextViewController, animated:true, completion:nil)
//        print("image tapped")
//    }
    
    
}

extension HomeScreenController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
        cell.setVideo(video: video)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MediaCell
        self.tappedVideo = cell.getVideo()
        
        performSegue(withIdentifier: "toMovieSeque", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MediaDescriptionView
        vc.video = self.tappedVideo
    }
}
