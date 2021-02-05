//
//  SnowViewController.swift
//  Task2_SnowFireworksConfetti
//
//  Created by Alexandr Sopilnyak on 02.02.2021.
//

import UIKit

final class SnowViewController: UIViewController {
  
  private let gradientBackground: UIView = {
    let gradient = GradientView()
    gradient.translatesAutoresizingMaskIntoConstraints = false
    gradient.startColor = .systemTeal
    gradient.endColor  = .white
    
    return gradient
  }()
  
  private let button: UIButton = {
    let button = UIButton()
    button.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
    button.setTitle("Let it snow", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 10
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    return button
  }()
  
  private let snow: EmitterParticle = {
    let snow = EmitterParticle()
    snow.particleType = .snow
    snow.clipsToBounds = true
    snow.translatesAutoresizingMaskIntoConstraints = false
    return snow
  }()
  
  private var snowStarted = false
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      setupGradientBackground()
      layoutButton()
    }
  
  @objc private func buttonPressed() {
    UIView.animate(withDuration: 0.3,
        animations: { [weak self] in
            self?.button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
        completion: { _ in
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.button.transform = CGAffineTransform.identity
            }
        })
    
    switch snowStarted {
    case false:
      snowStarted = true
      setupButton(button, title: "Stop snow", titleColor: .red, for: .normal)
      
      view.insertSubview(snow, belowSubview: button)
      layoutSnow()
    case true:
      snowStarted = false
      setupButton(button, title: "Let it snow", titleColor: .systemBlue, for: .normal)
      
      snow.removeFromSuperview()
    }
    
  }
  
  private func setupGradientBackground() {
    view.addSubview(gradientBackground)
    
    NSLayoutConstraint.activate([gradientBackground.topAnchor.constraint(equalTo: view.topAnchor),
                                 gradientBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 gradientBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 gradientBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
  }
  
  private func layoutSnow() {
    NSLayoutConstraint.activate([snow.topAnchor.constraint(equalTo: view.topAnchor),
                                 snow.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 snow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 snow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  
  private func layoutButton() {
    button.center = view.center
    view.addSubview(button)
  }
  

}

private extension SnowViewController {
  
   func setupButton(_ button: UIButton, title: String, titleColor: UIColor, for state: UIControl.State) {
    button.setTitle(title, for: state)
    button.setTitleColor(titleColor, for: state)
  }
  
}
