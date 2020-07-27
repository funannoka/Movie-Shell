//
//  SearchScreenController.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/9/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class SearchScreenController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchCollectionView: UICollectionView!
    var videos: [Video] = []
    var tappedVideo = Video(image: UIImage(), title: "", desc: "")
    
    var realData: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videos = createArray()
        realData = videos
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
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
    
   
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return videos.count
        //return number of rows in section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "searchCollectionCell", for: indexPath) as! SearchCollectionViewCell
        let video = videos[indexPath.row]
        
        cell.setVideo(video: video)
        
        return cell      //return your cell
    }
    
//MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: SearchCollectionViewCell = collectionView.cellForItem(at: indexPath as IndexPath) as! SearchCollectionViewCell
        self.tappedVideo = cell.getVideo()
        
        performSegue(withIdentifier: "searchToMovieSeque", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MediaDescriptionView
        vc.video = self.tappedVideo
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: "SearchBar", for: indexPath)
        
        return searchView
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       // searchBar.showsCancelButton = true
        self.videos.removeAll()
        for item in self.realData {
            if (item.title.lowercased().contains(searchBar.text!.lowercased())) {
                self.videos.append(item)
            }
        }
        
        if (searchBar.text!.isEmpty) {
            self.videos = self.realData
        }
        
        self.searchCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        self.videos.removeAll()
        self.videos = self.realData
        self.searchCollectionView.reloadData()
    //  self.dismiss(animated: true, completion: nil)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    //            searchActive = true
    //            searchCollectionView.reloadData()
    }

}

extension SearchScreenController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (self.view.frame.width/3)-7,
            height: self.view.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 414, height: 44 + 40)
    }

}

//extension SearchScreenController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
//    //MARK: Search Bar
//        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//            searchActive = false
//            self.dismiss(animated: true, completion: nil)
//        }
//
//        func updateSearchResults(for searchController: UISearchController)
//        {
//            let searchString = searchController.searchBar.text
//
//            filtered = videos.filter({ (video) -> Bool in
//                let countryVid: Video = video as Video
//                let countryText: NSString = countryVid.title as NSString
//
//                return (countryText.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
//            })
//
//            searchCollectionView.reloadData()
//
//        }
//
//        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//            searchActive = true
//            searchCollectionView.reloadData()
//        }
//
//
//        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//            searchActive = false
//            searchCollectionView.reloadData()
//        }
//
//        func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
//            if !searchActive {
//                searchActive = true
//                searchCollectionView.reloadData()
//            }
//
//            searchController.searchBar.resignFirstResponder()
//        }
//
//
//
//
//
//}
