//
//  SlideTransition.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import SnapKit
import UIKit

class SlideTransition: NSObject, UIViewControllerAnimatedTransitioning {
	
	let duration: TimeInterval = 0.4
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return duration
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard let toView = transitionContext.view(forKey: .to) else {
			transitionContext.completeTransition(true)
			return
		}
		let containerView = transitionContext.containerView
		containerView.addSubview(toView)
		containerView.layoutIfNeeded()
		toView.transform = CGAffineTransform(translationX: containerView.frame.width, y: 0)
		UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
			toView.transform = .identity
		}) { _ in
			transitionContext.completeTransition(true)
		}
	}
}
