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
		backgroundColor = .redderGray
		assemble()
		layout()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
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
			UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut, animations: {
				self.redderLabel.alpha = 0
			}) { _ in
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
					observer.onNext(())
				}
			}
			return Disposables.create()
		}
	}
}
