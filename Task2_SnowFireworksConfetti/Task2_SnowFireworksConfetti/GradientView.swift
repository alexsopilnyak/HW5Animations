//
//  GradientView.swift
//  Task2_SnowFireworksConfetti
//
//  Created by Alexandr Sopilnyak on 05.02.2021.
//

import UIKit

final class GradientView: UIView {
  var startColor: UIColor = .white
  var endColor: UIColor = .black
  
  override class var layerClass: AnyClass {
    CAGradientLayer.self
  }
  
  override func layoutSubviews() {
    (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
    
  }
}
