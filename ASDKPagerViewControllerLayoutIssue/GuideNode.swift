//
//  GuideNode.swift
//  TripstrThree
//
//  Created by Adlai Holler on 2/21/16.
//  Copyright © 2016 tripstr. All rights reserved.
//

import AsyncDisplayKit

final class GuideNode: ASDisplayNode {
	let pager = ASPagerNode()
	let header: GuideHeaderNode
	let footer: GuideFooterNode

	init(guide: Guide) {
		header = GuideHeaderNode(guide: guide)
		footer = GuideFooterNode(guide: guide)
		super.init()
		pager.preferredFrameSize.height = 400
		usesImplicitHierarchyManagement = true
	}

	override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
		return ASStackLayoutSpec(
			direction: .Vertical,
			spacing: 0,
			justifyContent: .Center,
			alignItems: .Stretch,
			children: [header, pager, footer])
	}
}
