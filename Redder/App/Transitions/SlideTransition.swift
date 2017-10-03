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

	enum Direction {
		case up
		case down
		case left
		case right
		
		func toViewStartPoint(for bounds: CGRect) -> CGPoint {
			switch self {
			case .up:
				return CGPoint(x: bounds.minX, y: bounds.height)
			case .down:
				return CGPoint(x: bounds.minX, y: -bounds.height)
			case .left:
				return CGPoint(x: bounds.width, y: bounds.minY)
			case .right:
				return CGPoint(x: -bounds.width, y: bounds.minY)
			}
		}
		
		func fromViewEndPoint(for bounds: CGRect) -> CGPoint {
			switch self {
			case .up:
				return CGPoint(x: bounds.minX, y: -bounds.height)
			case .down:
				return CGPoint(x: bounds.minX, y: bounds.height)
			case .left:
				return CGPoint(x: -bounds.width, y: bounds.minY)
			case .right:
				return CGPoint(x: bounds.width, y: bounds.minY)
			}
		}
	}
	
	let direction: Direction
	let duration: TimeInterval
	
	init(direction: Direction, duration: TimeInterval = 0.35) {
		self.direction = direction
		self.duration = duration
	}
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return duration
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		guard let fromView = transitionContext.view(forKey: .from), let toView = transitionContext.view(forKey: .to) else {
			transitionContext.completeTransition(true)
			return
		}
		let containerView = transitionContext.containerView
		containerView.addSubview(toView)
		toView.frame.origin = direction.toViewStartPoint(for: containerView.bounds)
		containerView.layoutIfNeeded()
		UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
			fromView.frame.origin = self.direction.fromViewEndPoint(for: containerView.bounds)
			toView.frame = containerView.bounds
			containerView.layoutIfNeeded()
		}) { _ in
			transitionContext.completeTransition(true)
		}
	}
}
