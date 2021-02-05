//
//  ViewController.swift
//  Task2_SnowFireworksConfetti
//
//  Created by Alexandr Sopilnyak on 31.01.2021.
//

import UIKit

final class AnimationsViewController: UIViewController {
  
  @IBOutlet private weak var pageControl: UIPageControl!
  @IBOutlet private weak var scrollView: UIScrollView!
 
  
  private var snowVC: SnowViewController {
    let snowVC = SnowViewController()
    snowVC.view.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(snowVC.view)
    addChild(snowVC)
    snowVC.didMove(toParent: self)
    
    return snowVC
  }
  
  private var confettiVC: ConfettiViewController  {
    let confettiVC = ConfettiViewController()
    confettiVC.view.translatesAutoresizingMaskIntoConstraints = false
    
    scrollView.addSubview(confettiVC.view)
    addChild(confettiVC)
    confettiVC.didMove(toParent: self)

    return confettiVC
  }
  
  private var fireworksVC: FireworksViewController  {
    let fireworksVC = FireworksViewController()
    fireworksVC.view.translatesAutoresizingMaskIntoConstraints = false
    scrollView.addSubview(fireworksVC.view)
    addChild(fireworksVC)
    fireworksVC.didMove(toParent: self)

    return fireworksVC
  }
 
  private var pages: [UIViewController] {
   [snowVC, confettiVC, fireworksVC]
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupScrollView()
    setupPageControl()
    setupViewsLayout()
  }
  
  
  private func setupScrollView() {
    scrollView.delegate = self
    scrollView.isPagingEnabled = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.showsVerticalScrollIndicator = false
  }
  
  private func setupPageControl() {
    view.bringSubviewToFront(self.pageControl)
    pageControl.numberOfPages = pages.count
    pageControl.currentPage = 0
    pageControl.addTarget(self, action: #selector(pageControllDidChange), for: .valueChanged)
  }
  
  private func setupViewsLayout() {
    let views: [String: UIView] = ["view": view, "page1": snowVC.view, "page2": confettiVC.view, "page3": fireworksVC.view]
    let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|", options: [], metrics: nil, views: views)
    let horisontalConstraints = NSLayoutConstraint.constraints(withVisualFormat:  "H:|[page1(==view)][page2(==view)][page3(==view)]|", options: [.alignAllTop, .alignAllBottom], metrics: nil, views: views)
    
    NSLayoutConstraint.activate(verticalConstraints + horisontalConstraints)
  }
  
  @objc private func pageControllDidChange(_ sender: UIPageControl) {
    let currentPage = sender.currentPage
    scrollView.setContentOffset(CGPoint(x: CGFloat(currentPage) * view.frame.size.width, y: 0), animated: true)
  }
}

extension AnimationsViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    pageControl.currentPage = Int(floor(Double(scrollView.contentOffset.x) / Double(scrollView.frame.size.width)))
  }
}
