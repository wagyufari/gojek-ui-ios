//
//  UIView+GestureRecognizer.swift
//  Gojek
//
//  Created by Muhammad Ghifari on 19/07/21.
//

import Foundation

//
//  UIView+GestureRecognizer.swift
//  ONE
//
//  Created by dennis farandy on 11/6/15.
//  Copyright © 2015 Happy5. All rights reserved.
//


//this taken from
//https://github.com/marcbaldwin/GestureRecognizerClosures/tree/master/GestureRecognizerClosures

import Foundation
import UIKit

extension UIView {
    
    func onTap(_ handler: @escaping (UITapGestureRecognizer) -> Void) {
        onTapWithTapCount(1, run: handler)
    }
    
    func onDoubleTap(_ handler: @escaping (UITapGestureRecognizer) -> Void) {
        onTapWithTapCount(2, run: handler)
    }

}

private extension UIView {
    
    func onTapWithTapCount(_ numberOfTaps: Int, run handler: @escaping (UITapGestureRecognizer) -> Void) {
        let tapGesture = UITapGestureRecognizer { gesture in
            handler(gesture as! UITapGestureRecognizer)
        }
        tapGesture.numberOfTapsRequired = numberOfTaps
        addGestureRecognizer(tapGesture)
    }
}
