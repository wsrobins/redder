//
//  LoginView.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxGesture
import RxSwift

protocol LoginViewInterface: class {
	var usernameFieldText: Observable<String> { get }
	var passwordFieldText: Observable<String> { get }
	var usernameFieldReturnKeyTap: Observable<Void> { get }
	var passwordFieldReturnKeyTap: Observable<Void> { get }
	var logInButtonTap: Observable<(String, String)> { get }
	var backgroundTap: Observable<Void> { get }
	func presentKeyboard(with observable: Observable<Void>)
	func dismissKeyboard(with observable: Observable<Void>)
	func nextField(with observable: Observable<Void>)
	func toggleLogInButtonIsHidden(with observable: Observable<Bool>)
}

final class LoginView: UIView, Bag {
	
	private lazy var containerView = UIView()
	
	private lazy var usernameField: UITextField = {
		let usernameField = UITextField()
		usernameField.placeholder = "Username"
		usernameField.font = .systemFont(ofSize: 20, weight: .light)
		usernameField.textContentType = .username
		usernameField.autocorrectionType = .no
		usernameField.autocapitalizationType = .none
		usernameField.returnKeyType = .next
		return usernameField
	}()
	
	private lazy var passwordField: UITextField = {
		let passwordField = UITextField()
		passwordField.placeholder = "Password"
		passwordField.font = .systemFont(ofSize: 20, weight: .light)
		passwordField.isSecureTextEntry = true
		passwordField.textContentType = .password
		passwordField.autocorrectionType = .no
		passwordField.autocapitalizationType = .none
		passwordField.returnKeyType = .done
		return passwordField
	}()
	
	private lazy var logInButton: UIButton = {
		let logInButton = UIButton()
		logInButton.setTitle("Log In", for: .normal)
		logInButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
		logInButton.setTitleColor(.black, for: .normal)
		logInButton.setTitleColor(.appDarkGray, for: .highlighted)
		logInButton.backgroundColor = .white
		logInButton.cornerRadius()
		logInButton.shadow(depth: .deep)
		logInButton.contentEdgeInsets = UIEdgeInsets(top: 9, left: 24, bottom: 9, right: 24)
		return logInButton
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
		addSubview(containerView)
		containerView.addSubview(usernameField)
		containerView.addSubview(passwordField)
		addSubview(logInButton)
	}
	
	private func layout() {
		layoutContainerView()
		layoutUsernameField()
		layoutPasswordField()
		layoutLogInButton()
	}
	
	private func layoutContainerView() {
		containerView.snp.remakeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview().offset(-100)
			make.width.equalToSuperview().inset(30)
		}
	}
	
	private func layoutUsernameField() {
		usernameField.snp.remakeConstraints { make in
			make.top.left.right.equalToSuperview()
		}
	}
	
	private func layoutPasswordField() {
		passwordField.snp.remakeConstraints { make in
			make.top.equalTo(usernameField.snp.bottom).offset(60)
			make.left.right.equalToSuperview()
		}
	}
	
	private func layoutLogInButton(isHidden: Bool = true) {
		logInButton.snp.remakeConstraints { make in
			make.top.equalTo(passwordField.snp.bottom).offset(60)
			make.bottom.equalTo(containerView)
			switch isHidden {
			case true:
				make.left.equalTo(snp.right).offset(10)
			case false:
				make.centerX.equalToSuperview()
			}
		}
	}
}

extension LoginView: LoginViewInterface {
	
	var usernameFieldText: Observable<String> {
		return usernameField.rx.text.map { text in text ?? "" }
	}
	
	var passwordFieldText: Observable<String> {
		return passwordField.rx.text.map { text in text ?? "" }
	}
	
	var usernameFieldReturnKeyTap: Observable<Void> {
		return usernameField.rx.controlEvent(.editingDidEndOnExit).asObservable()
	}
	
	var passwordFieldReturnKeyTap: Observable<Void> {
		return passwordField.rx.controlEvent(.editingDidEndOnExit).asObservable()
	}
	
	var logInButtonTap: Observable<(String, String)> {
		return logInButton.rx.tap.map { [usernameField, passwordField] in (usernameField.text ?? "", passwordField.text ?? "") }
	}
	
	var backgroundTap: Observable<Void> {
		return rx
			.tapGesture { _, delegate in delegate.simultaneousRecognitionPolicy = .never }
			.when(.recognized)
			.map { _ in }
	}
	
	func presentKeyboard(with observable: Observable<Void>) {
		observable
			.bind { [usernameField] in usernameField.becomeFirstResponder() }
			.disposed(by: bag)
	}
	
	func dismissKeyboard(with observable: Observable<Void>) {
		observable
			.bind { [endEditing] in _ = endEditing(true) }
			.disposed(by: bag)
	}
	
	func nextField(with observable: Observable<Void>) {
		observable
			.bind { [passwordField] in passwordField.becomeFirstResponder() }
			.disposed(by: bag)
	}
	
	func toggleLogInButtonIsHidden(with observable: Observable<Bool>) {
		observable
			.skip(1)
			.bind { [unowned self] isHidden in
				UIView.animate(
					withDuration: 0.5,
					delay: 0,
					usingSpringWithDamping: isHidden ? 1 : 0.8,
					initialSpringVelocity: 1,
					options: isHidden ? .curveEaseIn : .curveEaseOut,
					animations: {
						self.layoutLogInButton(isHidden: isHidden)
						self.layoutIfNeeded()
				})
			}
			.disposed(by: bag)
	}
}
