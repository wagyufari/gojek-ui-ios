//
//  ValueAnimator.swift
//  Gojek
//
//  Created by Muhammad Ghifari on 19/07/21.
//

import Foundation
import UIKit

// swiftlint:disable:next private_over_fileprivate
fileprivate var defaultFunction: (TimeInterval, TimeInterval) -> (Double) = { time, duration in
  return time / duration
}

class ValueAnimator {

  let from: Double
  let to: Double
  var duration: TimeInterval = 0
  var startTime: Date!
  var displayLink: CADisplayLink?
  var animationCurveFunction: (TimeInterval, TimeInterval) -> (Double)
  var valueUpdater: (Double) -> Void
  var completion: (() -> Void)? = nil
    

  init (from: Double = 0, to: Double = 1, duration: TimeInterval, animationCurveFunction: @escaping (TimeInterval, TimeInterval) -> (Double) = defaultFunction, valueUpdater: @escaping (Double) -> Void, completion: (() -> Void)? = nil) {
    self.from = from
    self.to = to
    self.duration = duration
    self.animationCurveFunction = animationCurveFunction
    self.valueUpdater = valueUpdater
    self.completion = completion
  }

  func start() {
    
    displayLink = CADisplayLink(target: self, selector: #selector(update))
    displayLink?.add(to: .current, forMode: .default)
  }

  @objc
  private func update() {

    if startTime == nil {
      startTime = Date()
      valueUpdater(from + (to - from) * animationCurveFunction(0, duration))
      return
    }

    var timeElapsed = Date().timeIntervalSince(startTime)
    var stop = false

    if timeElapsed > duration {
      timeElapsed = duration
      stop = true
        if let completion = completion{
            completion()
        }
    }

    valueUpdater(from + (to - from) * animationCurveFunction(timeElapsed, duration))

    if stop {
      cancel()
    }
  }

  func cancel() {
    self.displayLink?.remove(from: .current, forMode: .default)
    self.displayLink = nil
  }
}
