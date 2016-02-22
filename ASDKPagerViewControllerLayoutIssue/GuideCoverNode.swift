//
//  GuideCoverNode.swift
//  TripstrThree
//
//  Created by Adlai Holler on 2/21/16.
//  Copyright © 2016 tripstr. All rights reserved.
//

import AsyncDisplayKit

final class GuideCoverNode: ASCellNode {
	let imageNode = ASMultiplexImageNode()
	let titleNode = ASTextNode()

	let guide: Guide
	init(guide: Guide) {
		self.guide = guide
		super.init()
		usesImplicitHierarchyManagement = true
		titleNode.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
		titleNode.attributedString = guide.title?.attributed(GuideStyle.coverTitleAttr)
	}

	override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let stack = ASStackLayoutSpec(
			direction: .Vertical,
			spacing: 0,
			justifyContent: .End,
			alignItems: .Stretch,
			children: [titleNode])
		return ASOverlayLayoutSpec(child: imageNode, overlay: stack)
	}
}
