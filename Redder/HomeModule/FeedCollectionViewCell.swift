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
		let cardView = UIView()
		cardView.backgroundColor = .white
		cardView.shadow()
		return cardView
	}()
	
	private lazy var titleLabel: UILabel = {
		let titleLabel = UILabel()
		titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
		return titleLabel
	}()
	
	private lazy var descriptionLabel: UILabel = {
		let descriptionLabel = UILabel()
		descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
		return descriptionLabel
	}()
	
	private lazy var bottomPanelView: UIView = {
		let bottomPanelView = UIView()
		bottomPanelView.backgroundColor = .white
		return bottomPanelView
	}()
	
	private lazy var bottomPanelBorderView: UIView = {
		let bottomPanelBorderView = UIView()
		bottomPanelBorderView.backgroundColor = .appLightGray
		return bottomPanelBorderView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		assemble()
		layout()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
	private func assemble() {
		contentView.addSubview(cardView)
		cardView.addSubview(titleLabel)
		cardView.addSubview(descriptionLabel)
		cardView.addSubview(bottomPanelView)
		bottomPanelView.addSubview(bottomPanelBorderView)
	}
	
	private func layout() {
		cardView.snp.remakeConstraints { make in
			make.top.bottom.equalToSuperview().inset(5)
			make.left.right.equalToSuperview().inset(10)
		}
		titleLabel.snp.remakeConstraints { make in
			make.top.left.right.equalToSuperview().inset(18)
		}
		descriptionLabel.snp.remakeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).offset(8)
			make.left.right.equalTo(titleLabel)
		}
		bottomPanelView.snp.remakeConstraints { make in
			make.left.bottom.right.equalToSuperview()
			make.height.equalTo(50)
		}
		bottomPanelBorderView.snp.remakeConstraints { make in
			make.top.left.right.equalToSuperview()
			make.height.equalTo(1)
		}
	}
	
	func setUp(with item: FeedItem) {
		titleLabel.text = item.title
		descriptionLabel.text = item.description
	}
}
