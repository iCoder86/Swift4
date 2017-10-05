//
//  ViewController.swift
//  ProfileScrolView
//
//  Created by Mehul on 24/09/17.
//  Copyright © 2017 Mehul. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var destinationProfileImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var navBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.layer.borderWidth = 0.5
        profileImage.layer.masksToBounds = true
        
        scrollView.contentSize = CGSize(width: 0, height: 1200)
        
        scrollView.addSubview(profileView)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        
//        if offSetY > 400 {
//            UIView.animate(withDuration: 0.3, animations: {
//                scrollView.setContentOffset(CGPoint(x: 0, y: 400), animated: false)
//            })
//        }
//        else
        
        if offSetY > 0 {
            self.navBar.isHidden = false
            if offSetY > 200 {
                let scaleFactor = scrollView.contentOffset.y/100
                let moveX = scaleFactor*destinationProfileImage.center.x
                let moveY = scaleFactor*destinationProfileImage.center.y
                
                let point1 = profileImage.center
                let point2 = destinationProfileImage.center
                
                let xDist = (point2.x - point1.x); //[2]
                let yDist = (point2.y - point2.y); //[3]
                let distance = sqrt((xDist * xDist) + (yDist * yDist));
                
                print("Distance: \(distance)")
                
                profileImage.transform = CGAffineTransform(translationX: -moveX, y: -moveY)
                print("\(moveX, moveY)")
            }
        }
        else
        if (offSetY < 0) {
            navBar.isHidden = true
            
            let orgHeight = profileView.frame.size.height
            let scaleFactor = (orgHeight - scrollView.contentOffset.y) / orgHeight
            profileView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

