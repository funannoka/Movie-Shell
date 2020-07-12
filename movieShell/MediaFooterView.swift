//
//  MediaFooterView.swift
//  movieShell
//
//  Created by Funa Nnoka on 7/11/20.
//  Copyright © 2020 Funa Nnoka. All rights reserved.
//

import UIKit

class MediaFooterView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
//    func setUpFooter () {
//        self.isUserInteractionEnabled = true
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
//        self.addGestureRecognizer(tapRecognizer)
//        
//    }
//    
//
//   @objc func viewTapped(sender: UIView)  {
//
//       let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "toMovieSeque") as! MediaDescriptionView
//        let currentController = self.getCurrentViewController()
//        currentController?.present(nextViewController, animated: false, completion: nil)
//
//    }
//    
//    func getCurrentViewController() -> UIViewController? {
//
//        let keyWindow = UIApplication.shared.connectedScenes
//        .filter({$0.activationState == .foregroundActive})
//        .map({$0 as? UIWindowScene})
//        .compactMap({$0})
//        .first?.windows
//        .filter({$0.isKeyWindow}).first
//        
//        if let rootController = keyWindow?.rootViewController {
//            var currentController: UIViewController! = rootController
//            while( currentController.presentedViewController != nil ) {
//                currentController = currentController.presentedViewController
//            }
//            return currentController
//        }
//        return nil
//
//    }

}
