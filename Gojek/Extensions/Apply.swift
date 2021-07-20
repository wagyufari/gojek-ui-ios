//
//  Apply.swift
//  Performance
//
//  Created by Muhammad Ghifari on 23/06/21.
//

import Foundation

protocol Apply { }
extension Apply {
    func apply(closure:(Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
extension NSObject: Apply { }
