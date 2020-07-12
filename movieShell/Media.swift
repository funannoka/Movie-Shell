//
//  Media.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/9/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import Foundation
import UIKit

class Video {
    
    var image: UIImage
    var title: String
    var desc: String
    
    init(image:UIImage, title:String, desc:String) {
        self.image = image
        self.title = title
        self.desc = "This is the movie description about a movie that never existed but could, lol!\n\n\n Starring: My Cat and her attitude"
    }
}
