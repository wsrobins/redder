//
//  HomeView.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import RxCocoa
import RxSwift
import SnapKit

protocol HomeViewInterface: class {
	func bind(feedItems: Observable<[FeedItem]>)
}

final class HomeView: UIView {
	
	private let disposeBag: DisposeBag = DisposeBag()
	
	private lazy var feedCollectionView: UICollectionView = {
		let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 220)
		flowLayout.minimumLineSpacing = 0
		let feedCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		feedCollectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.reuseIdentifier)
		feedCollectionView.backgroundColor = .redderBackgroundGray
		feedCollectionView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
		return feedCollectionView
	}()
	
	init() {
		super.init(frame: .zero)
		self.assemble()
		self.layout()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	private func assemble() {
		self.addSubview(self.feedCollectionView)
	}
	
	private func layout() {
		self.feedCollectionView.snp.remakeConstraints { (make: ConstraintMaker) in
			make.edges.equalToSuperview()
		}
	}
}

extension HomeView: HomeViewInterface {
	
	func bind(feedItems: Observable<[FeedItem]>) {
		let reuseIdentifier: String = FeedCollectionViewCell.reuseIdentifier
		let cellType: FeedCollectionViewCell.Type = FeedCollectionViewCell.self
		feedItems
			.bind(to: self.feedCollectionView.rx.items(cellIdentifier: reuseIdentifier, cellType: cellType)) { (_, item: FeedItem, cell: FeedCollectionViewCell) in
				cell.setUp(with: item)
			}
			.disposed(by: self.disposeBag)
	}
}
