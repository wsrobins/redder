//
//  LaunchView.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxSwift
import SnapKit

protocol LaunchViewInterface: class {
	var launchAnimation: Observable<Void> { get }
}

final class LaunchView: UIView {
	
	private lazy var redderLabel: UILabel = {
		let redderLabel: UILabel = UILabel()
		redderLabel.text = "Redder"
		redderLabel.textAlignment = .center
		redderLabel.font = .systemFont(ofSize: 70, weight: .medium)
		return redderLabel
	}()
	
	init() {
		super.init(frame: .zero)
		self.backgroundColor = .white
		self.assemble()
		self.layout()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	private func assemble() {
		self.addSubview(self.redderLabel)
	}
	
	private func layout() {
		self.redderLabel.snp.remakeConstraints { (make: ConstraintMaker) in
			make.center.equalToSuperview()
		}
	}
}

extension LaunchView: LaunchViewInterface {
	
	var launchAnimation: Observable<Void> {
		return .create { (observer: AnyObserver<Void>) -> Disposable in
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseIn, animations: {
				self.redderLabel.alpha = 0
			}) { _ in
				observer.onNext(())
			}
			return Disposables.create()
		}
	}
}
