//
//  LoginView.swift
//  Redder
//
//  Created by William Robinson on 9/28/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

protocol LoginViewInterface: class {
	
}

final class LoginView: UIView {
	
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
		
	}
	
	private func layout() {
		
	}
}

extension LoginView: LoginViewInterface {
	
}
