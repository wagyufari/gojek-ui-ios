//
//  CGFloat+Extension.swift
//  Gojek
//
//  Created by Muhammad Ghifari on 19/07/21.
//

import Foundation
import UIKit

extension CGFloat{
    func isWhatPercentOf(of:CGFloat) -> CGFloat {
        (self / of) * 100
    }
    func toPercent(percentage:CGFloat) -> CGFloat {
        (percentage/100) * self
    }
}

