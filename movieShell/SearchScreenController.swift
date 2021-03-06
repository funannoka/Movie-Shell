//
//  SearchScreenController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/9/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit
import Firebase

class SearchScreenController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, TabBarReselectHandling {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    var videos: [Video] = []
    var tappedVideo = Video(image: UIImage(), title: "", desc: "", mp4: "")
    var realData: [Video] = []
    let db = Firestore.firestore()
    let storage = Storage.storage()
    //let placeholderImage = #imageLiteral(resourceName: "1")
    var storageRef : StorageReference = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        hideKeyboardWhenTappedAround()
        createArray()
        //navigationItem.hidesBackButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
//    func createArray() -> [Video] {
//        var tempVideos: [Video] = []
//
//        let video1 = Video(image: #imageLiteral(resourceName: "1"), title: "FUN HOME", desc: "This is the movie description about a movie that never existed but could, lol!\n Starring: My Cat and her attitude", mp4: "1.mp4")
//        let video2 = Video(image: #imageLiteral(resourceName: "2"), title: "SAD MAN", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video3 = Video(image: #imageLiteral(resourceName: "3"), title: "WEEP FOR MERCY", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video4 = Video(image: #imageLiteral(resourceName: "4"), title: "ALONE IN PARADISE", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video5 = Video(image: #imageLiteral(resourceName: "5"), title: "DEATH BY PEANUT", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video6 = Video(image: #imageLiteral(resourceName: "6"), title: "HOPELESS", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video7 = Video(image: #imageLiteral(resourceName: "7"), title: "NEED A FRIEND", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video8 = Video(image: #imageLiteral(resourceName: "8"), title: "THIRST", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video9 = Video(image: #imageLiteral(resourceName: "9"), title: "A DESPERATE MAN", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video10 = Video(image: #imageLiteral(resourceName: "10"), title: "PISSED OFF", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video11 = Video(image: #imageLiteral(resourceName: "11"), title: "DEEDS & DOOMS", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//        let video12 = Video(image: #imageLiteral(resourceName: "12"), title: "HUMANITY", desc: "This is the movie description about a movie that never existed but could, lol!", mp4: "1.mp4")
//
//        tempVideos.append(video1)
//        tempVideos.append(video2)
//        tempVideos.append(video3)
//        tempVideos.append(video4)
//        tempVideos.append(video5)
//        tempVideos.append(video6)
//        tempVideos.append(video7)
//        tempVideos.append(video8)
//        tempVideos.append(video9)
//        tempVideos.append(video10)
//        tempVideos.append(video11)
//        tempVideos.append(video12)
//
//
//        return tempVideos
//    }
//
    
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
                                    self.realData.append(video)

                                    DispatchQueue.main.async {
                                        self.searchCollectionView.reloadSections([1])
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return videos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: K.searchCellIdentifier, for: indexPath) as! SearchCollectionViewCell
        let video = videos[indexPath.row]
        
        cell.setVideo(video: video)
        
        return cell      
    }
    
//MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: SearchCollectionViewCell = collectionView.cellForItem(at: indexPath as IndexPath) as! SearchCollectionViewCell
        self.tappedVideo = cell.getVideo()
        
        performSegue(withIdentifier: K.searchToMovieSegue, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MediaDescriptionView
        vc.video = self.tappedVideo
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: K.searchBarIdentifier, for: indexPath)
        
        if indexPath.section == 1
        {
            searchView.isHidden = true
        }
        return searchView
    }
    
    func handleReselect() {
        self.searchCollectionView?.setContentOffset(.zero, animated: true)
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       // searchBar.showsCancelButton = true
        searchBar.endEditing(true)
        self.videos.removeAll()
        for item in self.realData {
            if (item.title.lowercased().contains(searchBar.text!.lowercased())) {
                self.videos.append(item)

            }
        }

        if (searchBar.text!.isEmpty) {
            self.videos = self.realData
        }
        self.searchCollectionView.reloadSections([1])
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
        self.videos.removeAll()
        self.videos = self.realData
        self.searchCollectionView.reloadSections([1])
    //  self.dismiss(animated: true, completion: nil)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
 
    }
    
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        //searchActive = false
//        self.videos.removeAll()
//        for item in self.realData {
//            if (item.title.lowercased().contains(searchBar.text!.lowercased())) {
//                self.videos.append(item)
//
//            }
//        }
//
//        if (searchBar.text!.isEmpty) {
//            self.videos = self.realData
//        }
//        self.searchCollectionView.reloadData()
//    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.videos.removeAll()
        for item in self.realData {
            if (item.title.lowercased().contains(searchBar.text!.lowercased())) {
                self.videos.append(item)

            }
        }

        if (searchBar.text!.isEmpty) {
            self.videos = self.realData
        }
        self.searchCollectionView.reloadSections([1])

    }
    
    

}

extension SearchScreenController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (collectionView.frame.width/3)-7,
            height: collectionView.frame.width/2)
    }
    
    //custom dimensions searchbar/collectionView header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        return section == 0 ? CGSize(width: collectionView.frame.width, height: 44 + 40) : CGSize(width: collectionView.frame.width, height: 0)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if section == 1 {
//          return UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
//        }
//        return UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
//    }
//
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//
}

