//
//  FireworksViewController.swift
//  Task2_SnowFireworksConfetti
//
//  Created by Alexandr Sopilnyak on 02.02.2021.
//

import UIKit

final class FireworksViewController: UIViewController {

  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    imageView.image = UIImage(named: "seattle")
    return imageView
  }()
  
  private let fireworks: EmitterParticle = {
    let fireworks = EmitterParticle()
    fireworks.particleType = .fireworks
    fireworks.translatesAutoresizingMaskIntoConstraints = false
    fireworks.clipsToBounds = true
    return fireworks
  }()
  
  private let skyView: UIView = {
    let sky = GradientView()
    sky.translatesAutoresizingMaskIntoConstraints = false
    sky.startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    sky.endColor = UIColor(red: 0.07, green: 0.04, blue: 0.66, alpha: 1)
    return sky
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      setupImageViewLayout()
      setupSkyViewLayout()
      setupFireworksLayout()
    }
    
  private func setupImageViewLayout() {
    view.addSubview(imageView)
    
    NSLayoutConstraint.activate([imageView.heightAnchor.constraint(equalToConstant: 300),
                                 imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
  }
  
  private func setupSkyViewLayout() {
    view.insertSubview(skyView, belowSubview: fireworks)
    
    NSLayoutConstraint.activate([skyView.topAnchor.constraint(equalTo: view.topAnchor),
                                 skyView.bottomAnchor.constraint(equalTo: imageView.topAnchor),
                                 skyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 skyView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
  }
  
  private func setupFireworksLayout() {
    view.addSubview(fireworks)
    
    NSLayoutConstraint.activate([fireworks.topAnchor.constraint(equalTo: view.topAnchor),
                                 fireworks.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 fireworks.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 fireworks.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
  }
  
}
