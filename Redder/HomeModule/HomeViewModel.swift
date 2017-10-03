//
//  HomeViewModel.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

struct HomeViewModel {
	
	struct Input {
		let viewWillAppear: Observable<Void>
		let viewDidAppear: Observable<Void>
	}
	
	struct Output {
		let showNavigationBar: Observable<Bool>
		let feedItems: Observable<[FeedItem]>
	}
	
	private unowned let wireframe: Wireframe
	
	private var feedItems: [FeedItem] {
		var feedItems: [FeedItem] = []
		for i in 0...100 {
			let feedItem = FeedItem(title: "Title \(i)", description: "Description \(i)")
			feedItems.append(feedItem)
		}
		return feedItems
	}
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		return Output(
			showNavigationBar: input.viewDidAppear.map { true },
			feedItems: input.viewWillAppear.map { [feedItems] in feedItems }
		)
	}
}
