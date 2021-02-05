//
//  SnowParticle.swift
//  Task2_SnowFireworksConfetti
//
//  Created by Alexandr Sopilnyak on 02.02.2021.
//

import UIKit

enum ParticleType {
  case snow
  case confetti
  case fireworks
}

fileprivate enum ParticleTexture {
  static let spark = UIImage(named: "spark")?.cgImage
  static let tspark = UIImage(named: "tspark")?.cgImage
  static let snow = UIImage(named: "snow")?.cgImage
  static let star = UIImage(named: "star")?.cgImage
  static let confetti = UIImage(named: "confetti")?.cgImage
  static let circle = UIImage(named: "circle")?.cgImage
  
}

final class EmitterParticle: UIView {
  
  var particleType: ParticleType = .snow
  
  override class var layerClass: AnyClass {
    CAEmitterLayer.self
  }
    
  override func layoutSubviews() {
    let emitter = self.layer as! CAEmitterLayer
    
    emitter.emitterShape = .line
    emitter.emitterPosition = CGPoint(x: bounds.midX, y: 0)
    emitter.emitterSize = CGSize(width: bounds.size.width, height: 1)
    
    switch particleType {
    case .snow:
      let near = makeSnowEmitterCell(color: UIColor(white: 1, alpha: 1), velocity: 100, scale: 0.3)
      let middle = makeSnowEmitterCell(color: UIColor(white: 1, alpha: 0.66), velocity: 80, scale: 0.2)
      let far = makeSnowEmitterCell(color: UIColor(white: 1, alpha: 0.33), velocity: 60, scale: 0.1)
      emitter.emitterCells = [near, middle, far]
      
    case .confetti:
      emitter.emitterCells = makeConfettiEmitterCells()
      
    case .fireworks:
      let rocket = rocketCell()
      emitter.emitterShape = .point
      emitter.emitterPosition = CGPoint(x: bounds.midX, y: bounds.height - 100 )
      emitter.emitterSize = CGSize(width: 0, height: 0)
      
      rocket.emitterCells = [flareCell(), fireworkCell()]
      emitter.emitterCells = [rocket]
    }
    
  }
  
  private func makeSnowEmitterCell(color: UIColor, velocity: CGFloat, scale: CGFloat) -> CAEmitterCell {
    let cell = CAEmitterCell()
    cell.birthRate = 10
    cell.lifetime = 20.0
    cell.lifetimeRange = 0
    cell.color = color.cgColor
    cell.velocity = velocity
    cell.velocityRange = velocity/4
    cell.emissionRange = .pi / 8
    cell.emissionLongitude = .pi
    cell.scale = scale
    cell.scaleRange = scale/3
    cell.contents = ParticleTexture.snow
    
    return cell
  }
  
  private func makeConfettiEmitterCells() -> [CAEmitterCell] {
    var cells = [CAEmitterCell]()
    
    for index in 0..<10 {
      let cell = CAEmitterCell()
      cell.birthRate = 5.0
      cell.lifetime = 20.0
      cell.velocity = CGFloat.random(in: 100.0...200.0)
      cell.velocityRange = cell.velocity / 3
      cell.xAcceleration = -5
      cell.yAcceleration = 20
      cell.emissionLongitude = .pi
      cell.emissionRange = 0.5
      cell.spin = 1.5
      cell.spinRange = 0
      cell.scale = 0.5
      cell.scaleRange = 0.5
      cell.color = getNextColor(index)
      cell.contents = getNextTexture(index)
      cells.append(cell)
    }
    
    return cells
  }
  
  private func fireworkCell() -> CAEmitterCell {
    let cell = CAEmitterCell()
    cell.contents = ParticleTexture.spark
    cell.birthRate = 8000
    cell.velocity = 130
    cell.lifetime = 1.0
    cell.emissionRange = (2 * .pi)
    cell.scale = 0.1
    cell.alphaSpeed = -0.2
    cell.yAcceleration = 80
    cell.beginTime = 1.5
    cell.duration = 0.1
    cell.scaleSpeed = -0.015
    cell.spin = 2
    
    return cell
  }
  
  private func rocketCell() -> CAEmitterCell {
    let cell = CAEmitterCell()
    cell.emissionLongitude = -.pi/2
    cell.emissionLatitude = 0
    cell.emissionRange = .pi/4
    cell.lifetime = 1.6
    cell.birthRate = 1
    cell.velocity = 50
    cell.velocityRange = cell.velocity/4
    cell.yAcceleration = -150
    let color = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    cell.color = color.cgColor
    cell.redRange = 0.5
    cell.greenRange = 0.5
    cell.blueRange = 0.5
    
    return cell
  }
  
  private func flareCell() -> CAEmitterCell {
    let cell = CAEmitterCell()
    cell.color = UIColor.white.cgColor
    cell.contents = ParticleTexture.tspark
    cell.emissionLongitude = (2 * .pi)
    cell.birthRate = 45
    cell.lifetime = 1.5
    cell.velocity = 100
    cell.scale = 0.3
    cell.yAcceleration = 350
    cell.emissionRange = .pi/7
    cell.alphaSpeed = -0.7
    cell.scaleSpeed = -0.1
    cell.scaleRange = 0.1
    cell.beginTime = 0.01
    cell.duration = 2.0
    
    return cell
  }
  
 
  
}

private extension EmitterParticle {
  private func getNextTexture(_ index: Int) -> CGImage? {
    let textures = [ParticleTexture.star, ParticleTexture.confetti, ParticleTexture.circle]
    return textures.randomElement()!
      }
  
  private func getNextColor(_ index: Int) -> CGColor {
    let colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.yellow, UIColor.purple]
    return colors[index % colors.count].cgColor
    
  }
}
