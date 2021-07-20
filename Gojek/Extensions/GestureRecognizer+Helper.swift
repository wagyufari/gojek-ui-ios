//
//  UIGestureRecognizer+Helper.swift
//  ONE
//
//  Created by dennis farandy on 11/6/15.
//  Copyright © 2015 Happy5. All rights reserved.
//

import Foundation
import UIKit

extension UIGestureRecognizer {
    fileprivate var handler: GestureRecognizerClosureHandler! {
        get { return objc_getAssociatedObject(self, &AssociatedKey.gestureHandler) as? GestureRecognizerClosureHandler }
        set { objc_setAssociatedObject(self, &AssociatedKey.gestureHandler, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    convenience init(handler: @escaping (UIGestureRecognizer) -> Void) {
        let handler = GestureRecognizerClosureHandler(handler: handler)
        self.init(target: handler, action: #selector(GestureRecognizerClosureHandler.handleGesture(_:)))
        self.handler = handler
    }
}

class GestureRecognizerClosureHandler: NSObject {
    fileprivate let handler: (UIGestureRecognizer) -> Void
    init(handler: @escaping (UIGestureRecognizer) -> Void) { self.handler = handler }
    @objc func handleGesture(_ gestureRecognizer: UIGestureRecognizer) { handler(gestureRecognizer) }
}

struct AssociatedKey {
    static var gestureHandler = "one_gestureHandler"
    static var buttonHandler = "one_buttonHandler"
    static var barbuttonHandler = "one_barbuttonHandler"
    
    static var viewEmptyState = "one_viewEmptyState"
}
