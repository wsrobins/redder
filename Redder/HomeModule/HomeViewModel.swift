//
//  HomeViewModel.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

struct HomeViewModel: ViewModelType {
	
	struct Input {
		let viewWillAppear: Observable<Void>
		let viewDidAppear: Observable<Void>
	}
	
	struct Output {
		let feedItems: Observable<[FeedItem]>
	}
	
	private unowned let wireframe: Wireframe
	
	private var feedItems: [FeedItem] {
		var feedItems: [FeedItem] = []
		for i in 0...10 {
			let feedItem: FeedItem = FeedItem(title: "Title \(i)", description: "Description \(i)")
			feedItems.append(feedItem)
		}
		return feedItems
	}
	
	init(wireframe: Wireframe) {
		self.wireframe = wireframe
	}
	
	func transform(input: Input) -> Output {
		wireframe.showNavigationBar(with: input.viewDidAppear)
		let feedItemsOutput: Observable<[FeedItem]> = input
			.viewWillAppear
			.map { _ -> [FeedItem] in
				return self.feedItems
		}
		return Output(feedItems: feedItemsOutput)
	}
}
