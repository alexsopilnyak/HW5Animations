//
//  ConfettiViewController.swift
//  Task2_SnowFireworksConfetti
//
//  Created by Alexandr Sopilnyak on 02.02.2021.
//

import UIKit

final class ConfettiViewController: UIViewController {

  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.image = #imageLiteral(resourceName: "birthday-cake")
    
    return imageView
  }()
  
  private let topLabel: UILabel = {
    let topLabel = UILabel()
    topLabel.translatesAutoresizingMaskIntoConstraints = false
    topLabel.text = "HAPPY BIRTHDAY"
    topLabel.font = UIFont(name: "American Typewriter", size: 40)
    topLabel.textColor = .white
    topLabel.textAlignment = .center
    topLabel.adjustsFontSizeToFitWidth = true
    
    return topLabel
  }()
  
  private let confetti: EmitterParticle = {
    let confetti = EmitterParticle()
    confetti.translatesAutoresizingMaskIntoConstraints = false
    confetti.clipsToBounds = true
    confetti.particleType = .confetti
    
    return confetti
  }()
  
  private let gradientBackground: UIView = {
    let gradient = GradientView()
    gradient.translatesAutoresizingMaskIntoConstraints = false
    gradient.startColor = .systemPink
    gradient.endColor  = .systemTeal
    
    return gradient
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      setupGradientBackground()
      setupImageLayout()
      setupLabelLayout()
      setupConfettiLayout()

    }
  
  private func setupGradientBackground() {
    view.addSubview(gradientBackground)
    
    NSLayoutConstraint.activate([gradientBackground.topAnchor.constraint(equalTo: view.topAnchor),
                                 gradientBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 gradientBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 gradientBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
  }
  
  private func setupImageLayout() {
    view.addSubview(imageView)
    
    NSLayoutConstraint.activate([imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                 imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                                 imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                 imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                 NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: imageView, attribute: .height, multiplier: 1.0, constant: 0)])
  }
  
  private func setupLabelLayout() {
    view.addSubview(topLabel)
    
    NSLayoutConstraint.activate([topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                 topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                                 topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                 topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
  }
  
  private func setupConfettiLayout() {
    view.addSubview(confetti)
    
    NSLayoutConstraint.activate([confetti.topAnchor.constraint(equalTo: view.topAnchor),
                                 confetti.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 confetti.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 confetti.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
  }
    
}
