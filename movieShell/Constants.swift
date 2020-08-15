//
//  constants.swift
//  movieShell
//
//  Created by Funa Nnoka on 8/1/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import Foundation

struct K {
    static let registerSegue = "landToRegister"
    static let loginSegue = "landToLogin"
    static let loginHomeSegue = "loginToHome"
    static let registerHomeSegue = "registerToHome"
    static let homeToMovieSegue = "homeToMovie"
    static let searchToMovieSegue = "searchToMovie"
    static let accountInfoSegue = "accountToInfo"
    static let appTitle = "movie shell"
    static let mediaCellIdentifier = "MediaCell"
    static let searchCellIdentifier = "searchCollectionCell"
    static let searchBarIdentifier = "SearchBar"
    static let accoutListCellIdentifier = "ListViewCell"
    static let homeTitle = "SHELL"
    
    
    struct FStore {
        static let collectionName = "movies"
        static let idField = "id"
        static let imageField = "image"
        static let titleField = "title"
        static let videoField = "video"
        static let descriptionField = "desc"
    }
}

 
