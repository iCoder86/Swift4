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
    let padding : CGFloat = 10
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
    var fontName:String = "Arial" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var multiLien : Bool = false {
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
        label.font = UIFont(name: fontName, size: 0)
        label.text = labelText
        label.textColor = textColor
        label.textAlignment = .center
        
        let circleRadius = (frame.width>frame.height) ? frame.height : frame.width
        label.layer.cornerRadius = ((circleRadius/2)  - padding)
        label.layer.masksToBounds = true
        
        label.numberOfLines = (multiLien) ? 0 : 1
        label.adjustsFontSizeToFitWidth = true;
        label.minimumScaleFactor = 0.01
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters;
        label.font = label.font.withSize(circleRadius)
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        var circleFrameSize = min(frame.width,frame.height)
        circleFrameSize = circleFrameSize - (2*padding)
        label.frame = CGRect(x: padding, y: padding, width: circleFrameSize, height: circleFrameSize)
        label.center = CGPoint(x: frame.width/2, y: frame.height/2)
    }
}
