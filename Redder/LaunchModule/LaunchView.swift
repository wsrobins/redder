//
//  LaunchView.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxSwift

protocol LaunchViewInterface: class {
	var launchAnimation: Observable<Void> { get }
}

final class LaunchView: UIView {
	
	private lazy var redderLabel: UILabel = {
		let redderLabel = UILabel()
		redderLabel.text = "Redder"
		redderLabel.textAlignment = .center
		redderLabel.font = .systemFont(ofSize: 70, weight: .medium)
		return redderLabel
	}()
	
	init() {
		super.init(frame: .zero)
		style()
		assemble()
		layout()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	private func style() {
		backgroundColor = .appLightGray
	}
	
	private func assemble() {
		addSubview(redderLabel)
	}
	
	private func layout() {
		redderLabel.snp.remakeConstraints { make in
			make.center.equalToSuperview()
		}
	}
}

extension LaunchView: LaunchViewInterface {
	
	var launchAnimation: Observable<Void> {
		return .create { observer in
			UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
				self.redderLabel.alpha = 0
			}) { _ in observer.onNext(()) }
			return Disposables.create()
		}
	}
}
