//
//  PulseAnimation.swift
//  Task1_PulseAnimation
//
//  Created by Alexandr Sopilnyak on 31.01.2021.
//

import UIKit

final class PulseAnimation: CALayer {
  
  private var animationGroup = CAAnimationGroup()
  
  var animationDuration: TimeInterval = 1.0
  var radius: CGFloat = 100
  
  override init(layer: Any) {
    super.init(layer: layer)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public init(radius: CGFloat, position: CGPoint, animationDuration: TimeInterval) {
    super.init()
    self.backgroundColor = UIColor.red.cgColor
    self.contentsScale = UIScreen.main.scale
    self.opacity = 0
    self.radius = radius
    self.position = position
    self.animationDuration = animationDuration
    
    self.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
    self.cornerRadius = radius
    
    DispatchQueue.global(qos: .default).async { [weak self] in
      guard let self = self else  { return }
      self.setupAnimationGroup()
      
      DispatchQueue.main.async { [weak self] in
        guard let self = self else  { return }
        self.add(self.animationGroup, forKey: "pulse")
      }
    }
  }
  
  private func scaleAnimation() -> CABasicAnimation {
    let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
    scaleAnimation.fromValue = 0
    scaleAnimation.toValue = 1
    scaleAnimation.duration = animationDuration
    
    return scaleAnimation
  }
  
  private func opacityAnimation() -> CABasicAnimation {
  let opacityAnimation = CABasicAnimation(keyPath: "opacity")
    opacityAnimation.duration = animationDuration
    opacityAnimation.fromValue = 1
    opacityAnimation.toValue = 0
    return opacityAnimation
  }
  
  private func setupAnimationGroup() {
    animationGroup.duration = animationDuration
    animationGroup.repeatCount = .infinity
    animationGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animationGroup.animations = [scaleAnimation(), opacityAnimation()]
  }
  
}
