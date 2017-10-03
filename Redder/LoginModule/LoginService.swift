//
//  LoginService.swift
//  Redder
//
//  Created by William Robinson on 9/30/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxSwift

struct LoginService {
	
	func authenticateUser(with credentials: Observable<(String, String)>) {
		let urlString = "https://www.reddit.com/api/v1/authorize?client_id=\(Secrets.clientID)&response_type=code&state=redder_authentication&redirect_uri=https://google.com&duration=permanent&scope=mysubreddits"
		credentials
			.map { username, password in URL(string: urlString)! }
			.bind { url in
				URLSession
					.shared
					.dataTask(with: url) { data, response, error in
						if let data = data {
							if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
								print(json)
							}
						}
						print(response)
						print(error)
					}
					.resume()
				
				UIApplication.shared.open(url)
		}
	}
}
