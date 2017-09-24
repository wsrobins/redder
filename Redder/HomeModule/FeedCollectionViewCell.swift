//
//  FeedCollectionViewCell.swift
//  Redder
//
//  Created by William Robinson on 9/24/17.
//  Copyright © 2017 William Robinson. All rights reserved.
//

import SnapKit
import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
	
	private lazy var cardView: UIView = {
		let cardView: UIView = UIView()
		cardView.backgroundColor = .white
		cardView.layer.shadowOpacity = 0.2
		cardView.layer.shadowRadius = 2
		cardView.layer.shadowOffset = CGSize(width: 0.5, height: 1)
		return cardView
	}()
	
	private lazy var titleLabel: UILabel = {
		let titleLabel: UILabel = UILabel()
		titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
		return titleLabel
	}()
	
	private lazy var descriptionLabel: UILabel = {
		let descriptionLabel: UILabel = UILabel()
		descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
		return descriptionLabel
	}()
	
	private lazy var bottomPanelView: UIView = {
		let bottomPanelView: UIView = UIView()
		bottomPanelView.backgroundColor = .white
		return bottomPanelView
	}()
	
	private lazy var bottomPanelBorderView: UIView = {
		let bottomPanelBorderView: UIView = UIView()
		bottomPanelBorderView.backgroundColor = #colorLiteral(red: 0.9543703168, green: 0.9543703168, blue: 0.9543703168, alpha: 1)
		return bottomPanelBorderView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.assemble()
		self.layout()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	private func assemble() {
		self.contentView.addSubview(self.cardView)
		self.cardView.addSubview(self.titleLabel)
		self.cardView.addSubview(self.descriptionLabel)
		self.cardView.addSubview(self.bottomPanelView)
		self.bottomPanelView.addSubview(self.bottomPanelBorderView)
	}
	
	private func layout() {
		self.cardView.snp.remakeConstraints { (make: ConstraintMaker) in
			make.top.bottom.equalToSuperview().inset(5)
			make.left.right.equalToSuperview().inset(10)
		}
		self.titleLabel.snp.remakeConstraints { (make: ConstraintMaker) in
			make.top.left.right.equalToSuperview().inset(18)
		}
		self.descriptionLabel.snp.remakeConstraints { (make: ConstraintMaker) in
			make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
			make.left.right.equalTo(self.titleLabel)
		}
		self.bottomPanelView.snp.remakeConstraints { (make: ConstraintMaker) in
			make.left.bottom.right.equalToSuperview()
			make.height.equalTo(50)
		}
		self.bottomPanelBorderView.snp.remakeConstraints { (make: ConstraintMaker) in
			make.top.left.right.equalToSuperview()
			make.height.equalTo(1)
		}
	}
	
	func setUp(with item: FeedItem) {
		self.titleLabel.text = item.title
		self.descriptionLabel.text = item.description
	}
}
