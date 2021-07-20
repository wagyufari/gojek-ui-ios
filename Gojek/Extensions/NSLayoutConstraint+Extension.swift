//
//  NSLayoutConstraint+Extension.swift
//  Gojek
//
//  Created by Muhammad Ghifari on 19/07/21.
//

import Foundation
import UIKit

extension NSLayoutConstraint{
    func animateConstant(value:CGFloat, completion: (() -> Void)? = nil) {
        ValueAnimator.init(from: Double(self.constant), to: Double(value), duration: 0.15) { Double in
            self.constant = CGFloat(Double)
        } completion: {
            if let completion = completion{
                completion()
            }
        }.start()

    }
}
