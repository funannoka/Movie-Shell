//
//  HomeScreenController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/9/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseUI


class HomeScreenController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
   
    var videos: [Video] = []
    var tappedVideo = Video(image: UIImage(), title: "", desc: "", mp4: "")
    let db = Firestore.firestore()
    let storage = Storage.storage()
    //let placeholderImage = #imageLiteral(resourceName: "1")
    var storageRef : StorageReference = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // videos = createArray()
        tableView.delegate = self
        tableView.dataSource = self
        title = K.homeTitle
        createArray()

       // navigationItem.hidesBackButton = true
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }
    
    func createArray(){
        //var tempVideos: [Video] = []
        let imageRef = storageRef.child("images")
        //let videoRef = storageRef.child("videos")
        // UIImageView in your ViewController
       // let imageView: UIImageView = UIImageView()
        
        db.collection(K.FStore.collectionName).getDocuments
        { (querySnapshot, error) in
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e.localizedDescription)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let movieTitle = data[K.FStore.titleField] as? String, let movieCoverName = data[K.FStore.imageField] as? String, let movieDescription = data[K.FStore.descriptionField] as? String, let mp4Name = data[K.FStore.videoField] as? String {
                            let movieCoverRef = imageRef.child(movieCoverName)
                            movieCoverRef.getData(maxSize: 6 * 1024 * 1024) { (cdata, error) in
                                if let err = error {
                                    print("There was an issue retrieving data from Firebase Storage.  \(err.localizedDescription)")
                                } else {
                                    let movieCover = UIImage(data: cdata!)
                                    let video = Video(image: movieCover!, title: movieTitle, desc: movieDescription, mp4: mp4Name)
                                    self.videos.append(video)
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
                                    }
                                    print(video.image, video.title, video.desc)
                                }
                                }
                            
                            }
                        
                        }
                    }
                }
            }
    }
    
    
    @IBAction func watchThisTapped(_ sender: UIButton) {
       // performSegue(withIdentifier: "homeToMovie", sender: self)

    }
    
//    func setUpFooter () {
//        MediaFooterView().isUserInteractionEnabled = true
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        MediaFooterView().addGestureRecognizer(tapRecognizer)
//    }
//
//    @objc func viewTapped(sender: UIView) {
//       let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//       let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homeToMovie") as! MediaDescriptionView
//       self.present(nextViewController, animated:true, completion:nil)
//        print("image tapped")
//    }
    
    
}

extension HomeScreenController:  UITableViewDataSource, UITableViewDelegate , TabBarReselectHandling {
    func handleReselect() {
        tableView?.setContentOffset(.zero, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let video = videos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.mediaCellIdentifier, for: indexPath) as! MediaCell
        cell.setVideo(video: video)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MediaCell
        self.tappedVideo = cell.getVideo()
        
        performSegue(withIdentifier: K.homeToMovieSegue, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MediaDescriptionView
        vc.video = self.tappedVideo
    }
}
