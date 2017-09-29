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
	var backgroundTap: Observable<Void> { get }
	func dismissKeyboard(with observable: Observable<Void>)
}

final class LoginView: UIView {
	
	private let disposeBag = DisposeBag()
	
	private lazy var fieldContainerView = UIView()
	
	private lazy var usernameField: UITextField = {
		let usernameField = UITextField()
		usernameField.placeholder = "USERNAME"
		usernameField.font = .systemFont(ofSize: 20, weight: .light)
		return usernameField
	}()
	
	private lazy var passwordField: UITextField = {
		let passwordField = UITextField()
		passwordField.placeholder = "PASSWORD"
		passwordField.isSecureTextEntry = true
		passwordField.font = .systemFont(ofSize: 20, weight: .light)
		return passwordField
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
		addSubview(fieldContainerView)
		fieldContainerView.addSubview(usernameField)
		fieldContainerView.addSubview(passwordField)
	}
	
	private func layout() {
		fieldContainerView.snp.remakeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview().offset(-90)
			make.width.equalToSuperview().inset(30)
		}
		usernameField.snp.remakeConstraints { make in
			make.top.left.right.equalToSuperview()
		}
		passwordField.snp.remakeConstraints { make in
			make.top.equalTo(usernameField.snp.bottom).offset(60)
			make.left.bottom.right.equalToSuperview()
		}
	}
}

extension LoginView: LoginViewInterface {
	
	var backgroundTap: Observable<Void> {
		return rx
			.tapGesture { _, delegate in delegate.simultaneousRecognitionPolicy = .never }
			.when(.recognized)
			.map { _ in }
	}
	
	func dismissKeyboard(with observable: Observable<Void>) {
		observable
			.bind { [unowned self] in self.endEditing(true) }
			.disposed(by: disposeBag)
	}
}
