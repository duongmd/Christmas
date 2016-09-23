//
//  ViewController.swift
//  Christmas
//
//  Created by techmaster on 9/22/16.
//  Copyright © 2016 MD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestures = UITapGestureRecognizer(target: self, action: #selector(onTap(tapGesture:)))        
        self.view.addGestureRecognizer(tapGestures)
    }

    func onTap(tapGesture: UITapGestureRecognizer) {
        let snow = UIImageView(image: UIImage(named: "white-snow"))
        snow.bounds.size = CGSize(width: 30, height: 30)
        let point = tapGesture.location(in: self.view)
        snow.center = point
        self.view.addSubview(snow)
    }

}

