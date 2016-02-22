//
//  GuideRecNode.swift
//  TripstrThree
//
//  Created by Adlai Holler on 2/21/16.
//  Copyright © 2016 tripstr. All rights reserved.
//

import AsyncDisplayKit

//final class GuideRecScrollNode: ASScrollNode {
//	let recNode: GuideRecNode
//	init(rec: Rec) {
//		recNode = GuideRecNode(rec: rec)
//		super.init()
//		usesImplicitHierarchyManagement = true
//	}
//
//	override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
//		return ASInsetLayoutSpec(insets: UIEdgeInsetsZero, child: recNode)
//	}
//}

final class GuideRecNode: ASDisplayNode {
	let imageNode = ASMultiplexImageNode()
	let titleNode = ASTextNode()
	let categoryNode = ASTextNode()
	let journalNode = ASTextNode()
	let hairlineAfterJournalNode = ASDisplayNode()
	let captionNode = ASTextNode()

	init(rec: Rec) {

		/// Have to use `viewBlock` here to support this as ASViewController.node
		super.init(viewBlock: { UIView() }, didLoadBlock: nil)

		usesImplicitHierarchyManagement = true
		captionNode.attributedString = rec.caption?.attributed(GuideStyle.captionAttr)
		titleNode.attributedString = rec.poi.name.attributed(GuideStyle.poiNameAttr)
		categoryNode.attributedString = rec.poi.categoryName.attributed(GuideStyle.poiCategoryAttr)
	}

	override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
		return ASStackLayoutSpec(
			direction: .Vertical,
			spacing: 2,
			justifyContent: .Center,
			alignItems: .Stretch,
			children: [imageNode, titleNode, categoryNode, hairlineAfterJournalNode, captionNode])
	}
}