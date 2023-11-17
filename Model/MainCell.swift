//
//  MainCell.swift
//  CardAlbum
//  Created by batuhan on 20.09.2023.
//

import UIKit

final class MainCell: UICollectionViewCell {
    
    static let reuseIdentifier = "collectionViewCell"
    
    let imageView : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "2")
        img.clipsToBounds = true
        return img
    }()
    
    var checkMark : Bool? {
        willSet{
            if checkMark == true {
                imageView.layer.borderWidth = 2
                imageView.layer.borderColor = UIColor.systemBlue.cgColor
            }else {
                imageView.layer.borderWidth = 0
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
                                  
}
