//
//  MBColorLabel.swift
//  MBColorLabel
//
//  Created by cloudZon Infosoft on 05/10/17.
//  Copyright © 2017 MB. All rights reserved.
//

import UIKit

@IBDesignable
class MBColorLabel: UIView {

    var label = UILabel()
    
    @IBInspectable
    var labelText:String = "Label" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor:UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var fontSize:CGFloat = CGFloat(17.0) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var fontName:String = "Arial" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var circleColor: UIColor = .lightGray {
        didSet {
            label.backgroundColor = circleColor
        }
    }

    func updateView() {
        label.frame = self.bounds
        label.center = self.center
        label.font = UIFont(name: fontName, size: fontSize)
        label.text = labelText
        label.textColor = textColor
        label.textAlignment = .center
        
        let minRadiuc = min(frame.width,frame.height)
        let circleRadius = (frame.width>frame.height) ? frame.height : frame.width
        label.layer.cornerRadius = circleRadius/2
        label.layer.masksToBounds = true
        label.sizeToFit()
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
}
