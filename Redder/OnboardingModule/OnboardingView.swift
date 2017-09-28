//
//  OnboardingView.swift
//  Redder
//
//  Created by William Robinson on 9/25/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

protocol OnboardingViewInterface: class {
	var loginButtonTap: ControlEvent<Void> { get }
	var signUpButtonTap: ControlEvent<Void> { get }
	var skipButtonTap: ControlEvent<Void> { get }
}

final class OnboardingView: UIView {
	
	private lazy var loginButton: UIButton = {
		let loginButton = UIButton()
		loginButton.setTitle("LOGIN", for: .normal)
		loginButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .light)
		loginButton.setTitleColor(.black, for: .normal)
		loginButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
		return loginButton
	}()
	
	private lazy var signUpButton: UIButton = {
		let signUpButton = UIButton()
		signUpButton.setTitle("SIGN UP", for: .normal)
		signUpButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .light)
		signUpButton.setTitleColor(.black, for: .normal)
		signUpButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
		return signUpButton
	}()
	
	private lazy var skipButton: UIButton = {
		let skipButton = UIButton()
		skipButton.setTitle("SKIP", for: .normal)
		skipButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
		skipButton.setTitleColor(.black, for: .normal)
		skipButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
		return skipButton
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
		addSubview(loginButton)
		addSubview(signUpButton)
		addSubview(skipButton)
	}
	
	private func layout() {
		loginButton.snp.remakeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview().offset(-60)
		}
		signUpButton.snp.remakeConstraints { make in
			make.top.equalTo(loginButton.snp.bottom).offset(40)
			make.centerX.equalToSuperview()
		}
		skipButton.snp.remakeConstraints { make in
			make.bottom.equalToSuperview().inset(30)
			make.centerX.equalToSuperview()
		}
	}
}

extension OnboardingView: OnboardingViewInterface {
	
	var loginButtonTap: ControlEvent<Void> {
		return loginButton.rx.tap
	}
	
	var signUpButtonTap: ControlEvent<Void> {
		return signUpButton.rx.tap
	}
	
	var skipButtonTap: ControlEvent<Void> {
		return skipButton.rx.tap
	}
}
