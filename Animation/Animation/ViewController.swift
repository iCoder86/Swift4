//
//  ViewController.swift
//  Animation
//
//  Created by Mehul on 23/09/17.
//  Copyright © 2017 Mehul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btnShuffel: UIButton!
    @IBOutlet var btnFavorite: UIButton!
    @IBOutlet var btnRepeat:UIButton!
    @IBOutlet var btnMenu: UIButton!
    
    var btnShuffelPosition:CGPoint!
    var btnFavoritePosition:CGPoint!
    var btnRepeatPosition:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnShuffel.setTitleColor(.red, for: .normal)
        btnFavorite.setTitleColor(.red, for: .normal)
        btnRepeat.setTitleColor(.red, for: .normal)
        
        btnShuffelPosition = btnShuffel.center
        btnFavoritePosition = btnFavorite.center
        btnRepeatPosition = btnRepeat.center
        
        toggleMenuButton(nil)
    }

    @IBAction func toggleMenuButton(_ sender:UIButton?) {
        if btnMenu.tag == 0 {
            self.btnMenu.tag = 1
            UIView.animate(withDuration: 0.3, animations: {
                self.btnShuffel.center = self.btnMenu.center
                self.btnFavorite.center = self.btnMenu.center
                self.btnRepeat.center = self.btnMenu.center
                
                self.btnShuffel.alpha = 0
                self.btnFavorite.alpha = 0
                self.btnRepeat.alpha = 0
            })
        }
        else {
            self.btnMenu.tag = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.btnShuffel.center = self.btnShuffelPosition
                self.btnFavorite.center = self.btnFavoritePosition
                self.btnRepeat.center = self.btnRepeatPosition
                
                self.btnShuffel.alpha = 1
                self.btnFavorite.alpha = 1
                self.btnRepeat.alpha = 1
            })
        }
    }
    
    @IBAction func toggleAction(_ sender:UIButton) {
        if let color = sender.titleLabel!.textColor, color == .red {
            sender.setTitleColor(.green, for: .normal)
        }
        else {
            sender.setTitleColor(.red, for: .normal)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

