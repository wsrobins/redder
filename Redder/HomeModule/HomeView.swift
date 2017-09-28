//
//  HomeView.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift

protocol HomeViewInterface: class {
	func bind(feedItems: Observable<[FeedItem]>)
}

final class HomeView: UIView {
	
	private let disposeBag = DisposeBag()
	
	private lazy var feedCollectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 220)
		flowLayout.minimumLineSpacing = 0
		let feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		feedCollectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.reuseIdentifier)
		feedCollectionView.backgroundColor = .redderGray
		feedCollectionView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
		return feedCollectionView
	}()
	
	init() {
		super.init(frame: .zero)
		assemble()
		layout()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	private func assemble() {
		addSubview(feedCollectionView)
	}
	
	private func layout() {
		feedCollectionView.snp.remakeConstraints { make in
			make.edges.equalToSuperview()
		}
	}
}

extension HomeView: HomeViewInterface {
	
	func bind(feedItems: Observable<[FeedItem]>) {
		let reuseIdentifier = FeedCollectionViewCell.reuseIdentifier
		let cellType = FeedCollectionViewCell.self
		feedItems
			.bind(to: feedCollectionView.rx.items(cellIdentifier: reuseIdentifier, cellType: cellType)) { _, item, cell in
				cell.setUp(with: item)
			}
			.disposed(by: disposeBag)
	}
}
