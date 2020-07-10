//
//  HomeScreenController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/9/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videos = createArray()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }
    
    func createArray() -> [Video] {
        var tempVideos: [Video] = []
        
        let video1 = Video(image: #imageLiteral(resourceName: "1"), title: "FUN HOME")
        let video2 = Video(image: #imageLiteral(resourceName: "2"), title: "SAD MAN")
        let video3 = Video(image: #imageLiteral(resourceName: "3"), title: "WEEP FOR MERCY")
        let video4 = Video(image: #imageLiteral(resourceName: "4"), title: "ALONE IN PARADISE")
        let video5 = Video(image: #imageLiteral(resourceName: "5"), title: "DEATH BY PEANUT")
        let video6 = Video(image: #imageLiteral(resourceName: "6"), title: "HOPELESS")
        let video7 = Video(image: #imageLiteral(resourceName: "7"), title: "NEED A FRIEND")
        let video8 = Video(image: #imageLiteral(resourceName: "8"), title: "THIRST")
        let video9 = Video(image: #imageLiteral(resourceName: "9"), title: "A DESPERATE MAN")
        let video10 = Video(image: #imageLiteral(resourceName: "10"), title: "PISSED OFF")
        let video11 = Video(image: #imageLiteral(resourceName: "11"), title: "DEEDS & DOOMS")
        let video12 = Video(image: #imageLiteral(resourceName: "12"), title: "HUMANITY")
        
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
}

extension HomeScreenController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell") as! MediaCell
        
        cell.setVideo(video: video)
        
        return cell
    }
}
