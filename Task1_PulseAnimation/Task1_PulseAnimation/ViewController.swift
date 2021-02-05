//
//  ViewController.swift
//  Task1_PulseAnimation
//
//  Created by Alexandr Sopilnyak on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func startButtonPressed(_ sender: UIButton) {
    startPulseAnimation()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
      self.startPulseAnimation()
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        self.startPulseAnimation()
      }
    }
    
  }
  
  private func startPulseAnimation() {
    let pulseAnimation = PulseAnimation(radius: 75, position: view.center, animationDuration: 1)
    view.layer.addSublayer(pulseAnimation)
  }
  
  @IBAction func stopButtonPressed(_ sender: UIButton) {
    view.layer.sublayers?.forEach{$0.removeAllAnimations()}
  }
  
}

