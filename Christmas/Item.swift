//
//  Item.swift
//  Christmas
//
//  Created by techmaster on 9/22/16.
//  Copyright © 2016 MD. All rights reserved.
//

import UIKit

//Custom 1 class xu ly da cham
//kế thừa từ UIImageView
class Item: UIImageView {
    
    // custom 1 object kế thừa kiểu UI thì phải có method khởi tạo này
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()    //Hàm setup xử lý toàn bộ tương tác đa chạm
    }
    
    func setup(){
        
        //Để sử dụng tương tác đa chạm
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
        
        let panGestures = UIPanGestureRecognizer(target: self, action: #selector(onPan(panGesture:)))
        self.addGestureRecognizer(panGestures)
        
        let pinchGestures = UIPinchGestureRecognizer(target: self, action: #selector(pinchPhoto(pinGesture:)))
        self.addGestureRecognizer(pinchGestures)
        
   //     let rotateGestures = UIRotationGestureRecognizer(target: self, action: #selector(rotateItem(rotateGesture:)))
        self.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(rotateItem(rotateGesture:))))
    }
    
    func onPan(panGesture: UIPanGestureRecognizer) {
        
        if (panGesture.state == .began || panGesture.state == .changed) {
            
            //Lay toa do va gan
            let point = panGesture.location(in: self.superview)
            self.center = point
        }
    }
    
    
    
    func pinchPhoto(pinGesture: UIPinchGestureRecognizer) {
        if let view = pinGesture.view {
            view.transform = view.transform.scaledBy(x: pinGesture.scale, y: pinGesture.scale)
            pinGesture.scale = 1.0
        }
    }

    
    
    func rotateItem(rotateGesture: UIRotationGestureRecognizer) {
        if let view = rotateGesture.view {
            view.transform = view.transform.rotated(by: rotateGesture.rotation)
            rotateGesture.rotation = 0
        }
    }
    
}
