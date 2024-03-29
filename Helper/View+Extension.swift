//
//  View+Extension.swift
//  CardAlbum
//
//
//  Created by batuhan on 20.03.2023.
//

import Foundation
import UIKit


extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?,
                bottom : NSLayoutYAxisAnchor?,
                leading : NSLayoutXAxisAnchor?,
                trailing : NSLayoutXAxisAnchor?,
                paddingTop : CGFloat,
                paddingBottom : CGFloat,
                paddingLeft : CGFloat,
                paddingRight : CGFloat,
                width : CGFloat,
                height : CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top,constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
            
        }
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo:trailing,constant: paddingRight ).isActive = true
        }
        if  width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
            
        }
        if  height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func addSubviews(_ views : UIView...){
        for view in views{
            addSubview(view)
        }
    }
   
    
}
