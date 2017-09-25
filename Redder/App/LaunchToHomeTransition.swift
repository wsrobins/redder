//
//  LaunchToHomeTransition.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import SnapKit
import UIKit

class LaunchToHomeTransition: NSObject, UIViewControllerAnimatedTransitioning {
	
	let duration: TimeInterval = 0.35
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return self.duration
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard let toView: UIView = transitionContext.view(forKey: .to) else {
			transitionContext.completeTransition(true)
			return
		}
		let containerView: UIView = transitionContext.containerView
		containerView.addSubview(toView)
		toView.snp.remakeConstraints { (make: ConstraintMaker) in
			make.top.bottom.width.equalToSuperview()
			make.left.equalTo(containerView.snp.right)
		}
		containerView.layoutIfNeeded()
		UIView.animate(withDuration: self.duration, delay: 0, options: .curveEaseOut, animations: {
			toView.snp.remakeConstraints { (make: ConstraintMaker) in
				make.edges.equalToSuperview()
			}
			containerView.layoutIfNeeded()
		}) { _ in
			transitionContext.completeTransition(true)
		}
	}
}
