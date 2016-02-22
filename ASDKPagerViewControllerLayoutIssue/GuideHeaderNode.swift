//
//  GuideHeaderNode.swift
//  TripstrThree
//
//  Created by Adlai Holler on 2/21/16.
//  Copyright © 2016 tripstr. All rights reserved.
//

import AsyncDisplayKit

final class GuideHeaderNode: ASCellNode {
	let avatarNode = ASMultiplexImageNode()
	let usernameNode = ASTextNode()
	let cityNode = ASTextNode()
	let mapBtnNode = ASButtonNode()

	init(guide: Guide) {
		super.init()
		usesImplicitHierarchyManagement = true

		usernameNode.attributedString = guide.creator.username.attributed(GuideStyle.headerUsernameAttr)
		let attributedCityText = "while in ".attributedMutable(GuideStyle.headerWhileInAttr)
		attributedCityText += guide.city.name.attributed(GuideStyle.headerCityAttr)
		cityNode.attributedString = attributedCityText
	}

	override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {

		let leftStack = ASStackLayoutSpec(
			direction: .Horizontal,
			spacing: 2,
			justifyContent: .Center,
			alignItems: .Stretch,
			children: [ avatarNode, usernameNode ])
		let rightStack = ASStackLayoutSpec(
			direction: .Horizontal,
			spacing: 2,
			justifyContent: .Center,
			alignItems: .Stretch,
			children: [ cityNode, mapBtnNode ])

		let stack = ASStackLayoutSpec(
			direction: .Horizontal,
			spacing: 2,
			justifyContent: .SpaceBetween,
			alignItems: .Stretch,
			children: [ leftStack, rightStack ])
		return ASInsetLayoutSpec(insets: GuideStyle.headerInset, child: stack)
	}
}
