//
//  CustomViewSignIn.swift
//  Kenakata
//
//  Created by Md Sifat on 5/10/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import UIKit

class CustomViewSignIn: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customizeView()
    }
    
   func  customizeView(){
    layer.cornerRadius = 15
    clipsToBounds = true
    }
}
