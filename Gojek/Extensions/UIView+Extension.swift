//
//  UIView+Extension.swift
//  Gojek
//
//  Created by Muhammad Ghifari on 17/07/21.
//

import Foundation
import UIKit

extension UIView {
    
    public func removeAllConstraints() {
        var _superview = self.superview
        
        while let superview = _superview {
            for constraint in superview.constraints {
                
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            
            _superview = superview.superview
        }
        
        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    
    
        func card() {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.5
            layer.shadowOffset = .zero
            layer.shadowRadius = 6
        }
    
    
}

extension UIView {
    
    class func nibName() -> String {
        return "\(self)".components(separatedBy: ".").last ?? ""
    }
    
    class func viewFromXib() -> Self {
        return typeSafeFromXib()
    }
    
    fileprivate class func typeSafeFromXib<T:UIView>() -> T {
        if let view: AnyObject = Bundle.main.loadNibNamed(self.nibName(), owner: nil, options: nil)?.first as AnyObject? {
            if let viewT = view as? T {
                return viewT
            } else {
                return T()
            }
        } else {
            return T()
        }
    }
    
    class func nib() -> UINib {
        let nib = UINib(nibName:self.nibName(), bundle: Bundle.main)
        return nib
    }
    
    class func identifier() -> String {
        return "\(self)"
    }
}
