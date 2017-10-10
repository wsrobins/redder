//
//  OnboardingView.swift
//  Redder
//
//  Created by William Robinson on 9/25/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

protocol OnboardingViewOutput: class {
	var connectButtonTap: Driver<Void> { get }
	var skipButtonTap: Driver<Void> { get }
}

final class OnboardingView: UIView {
	
	private lazy var connectButton: UIButton = {
		let connectButton = UIButton()
		connectButton.setTitle("CONNECT REDDIT ACCOUNT", for: .normal)
		connectButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .light)
		connectButton.setTitleColor(.black, for: .normal)
		connectButton.setTitleColor(.appDarkGray, for: .highlighted)
		connectButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
		connectButton.cornerRadius()
		connectButton.shadow(depth: .deep)
		return connectButton
	}()
	
	private lazy var skipButton: UIButton = {
		let skipButton = UIButton()
		skipButton.setTitle("SKIP FOR NOW", for: .normal)
		skipButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
		skipButton.setTitleColor(.black, for: .normal)
		skipButton.setTitleColor(.appDarkGray, for: .highlighted)
		skipButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
		skipButton.cornerRadius()
		skipButton.shadow(depth: .deep)
		return skipButton
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
		addSubview(connectButton)
		addSubview(skipButton)
	}
	
	private func layout() {
		layoutConnectButton()
		layoutSkipButton()
	}
	
	private func layoutConnectButton() {
		connectButton.snp.remakeConstraints { make in
			make.center.equalToSuperview()
		}
	}
	
	private func layoutSkipButton() {
		skipButton.snp.remakeConstraints { make in
			make.bottom.equalToSuperview().inset(20)
			make.centerX.equalToSuperview()
		}
	}
}

extension OnboardingView: OnboardingViewOutput {
	
	var connectButtonTap: Driver<Void> {
		return connectButton.rx.tap.asDriver()
	}
	
	var skipButtonTap: Driver<Void> {
		return skipButton.rx.tap.asDriver()
	}
}
