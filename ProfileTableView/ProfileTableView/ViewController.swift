//
//  ViewController.swift
//  ProfileTableView
//
//  Created by Mehul on 24/09/17.
//  Copyright © 2017 Mehul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var profileHeaderView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var destinationProfileImage: UIImageView!
    @IBOutlet weak var viewHeader:UIView!
    @IBOutlet var sectionHeaderView: UIView!
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var tmpImage:UIImageView!
    @IBOutlet weak var tmpButton:UIButton!
    @IBOutlet weak var tmpView:UIView!
  
    var initialProfileValue = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.layer.borderWidth = 0.5
        profileImage.layer.masksToBounds = true
        
        destinationProfileImage.layer.cornerRadius = destinationProfileImage.frame.width/2
        destinationProfileImage.layer.borderWidth = 0.5
        destinationProfileImage.layer.masksToBounds = true

        table.delegate = self
        table.dataSource = self
        
        table.tableFooterView = UIView()
        table.tableHeaderView = profileHeaderView
        
        initialProfileValue = profileImage.center
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        if offSetY > 1 {

//            if self.viewHeader.alpha == 0 {
//                UIView.animate(withDuration: 0.5, animations: {
                    // Show HeaderView
                    self.viewHeader.alpha = 1
                    
                    // Get the center point of the destinationview respective to self.view
                    let center = self.viewHeader.convert(self.destinationProfileImage.center, to: self.view)
            
//                    let dx = center.x - (self.profileImage.center.x+(offSetY))
//                    let dy = center.y - (self.profileImage.center.y+(offSetY))
            
                    let dx = center.x - self.profileImage.center.x
                    let destinationX = max(-offSetY,dx)
            
                    let dy = center.y - self.profileImage.center.y
                    let destinationY = max(-offSetY,dy)
            
            
                    var transformation = CGAffineTransform.identity
            
                    // Scale
                    let orgHeight = profileHeaderView.frame.size.height
                    let scaleFactor = (orgHeight - scrollView.contentOffset.y) / orgHeight
                    transformation = transformation.translatedBy(x: destinationX, y: 1)
            
                    // Transform
                    transformation = transformation.scaledBy(x: scaleFactor, y: scaleFactor)
                    self.profileImage.transform = transformation

            
//                    self.table.frame = CGRect(x: 0, y: 84, width: self.view.frame.width, height: self.view.frame.height-84)
                    self.table.reloadData()
//                })
//            }
        }
        else {
            if self.viewHeader.alpha != 0 {
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.profileImage.transform = CGAffineTransform.identity
                    
                    // Hide HeaderView
                    self.viewHeader.alpha = 0
                    self.table.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height-20)
                    self.table.reloadData()
                })
            }
        }
        
        if (offSetY <= 0) {
            let orgHeight = profileHeaderView.frame.size.height
            let scaleFactor = (orgHeight - scrollView.contentOffset.y) / orgHeight
            table.tableHeaderView?.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }
    }
    
    @IBAction func transformAction(_ sender:UIButton) {
        if self.tmpImage.transform.isIdentity {
            UIView.animate(withDuration: 1.0, animations: {
                
                // Get the center point of the destinationview respective to self.view
                let center = self.viewHeader.convert(self.destinationProfileImage.center, to: self.view)
                
                let dx = center.x - self.tmpImage.center.x
                let dy = center.y - (self.tmpImage.center.y)
                
                var transformation = CGAffineTransform.identity
                transformation = transformation.translatedBy(x: dx, y: dy)
                transformation = transformation.scaledBy(x: 0.5, y: 0.5)
                
                self.tmpImage.transform = transformation
            })
        }
        else {
            UIView.animate(withDuration: 1.0, animations: {
                self.tmpImage.transform = CGAffineTransform.identity
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.table.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section==0) ? 64 : 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return (section==0) ? sectionHeaderView : nil
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}



