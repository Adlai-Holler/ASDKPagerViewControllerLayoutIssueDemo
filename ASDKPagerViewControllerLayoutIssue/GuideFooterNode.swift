//
//  GuideFooterNode.swift
//  TripstrThree
//
//  Created by Adlai Holler on 2/21/16.
//  Copyright © 2016 tripstr. All rights reserved.
//

import AsyncDisplayKit

final class GuideFooterNode: ASDisplayNode {
	let items: [GuideFooterItemNode]
	
	init(guide: Guide) {
		let recsByType = guide.recsByType
		items = GuideFooterItem.all.map { item in
			if let recType = item.recType {
				return GuideFooterItemNode(
					item: item,
					dotCount: recsByType[recType]?.count ?? 0,
					selectedDotIndex: nil)
			} else {
				return GuideFooterItemNode(
					item: item,
					dotCount: 1,
					selectedDotIndex: 0)
			}
		}
		super.init()
		usesImplicitHierarchyManagement = true
	}

	override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
		return ASStackLayoutSpec(
			direction: .Horizontal,
			spacing: 2,
			justifyContent: .SpaceBetween,
			alignItems: .Stretch,
			children: items)
	}
}

final class GuideFooterItemNode: ASControlNode {
	let textNode = ASTextNode()
	let item: GuideFooterItem
	init(item: GuideFooterItem, dotCount: Int, selectedDotIndex: Int?) {
		self.item = item
		dots = (0..<dotCount).map { _ in
			let node = ASImageNode()
			node.alpha = 0.7
			return node
		}
		self.selectedDotIndex = selectedDotIndex
		super.init()
		usesImplicitHierarchyManagement = true
		textNode.attributedString = item.localizedName.attributed(GuideStyle.seeDoEatStayAttr)
	}

	let dots: [ASImageNode]
	private(set) var selectedDotIndex: Int?

	func setSelectedDotIndex(index: Int?) {
		if selectedDotIndex == index { return }
		assert(index < dots.count)
		if let selectedDotIndex = selectedDotIndex {
			dots[selectedDotIndex].alpha = 0.7
		}
		if let index = index {
			dots[index].alpha = 1
		}
	}

	override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let dotStack = ASStackLayoutSpec(
			direction: .Horizontal,
			spacing: 2,
			justifyContent: .Center,
			alignItems: .Stretch,
			children: dots)

		return ASStackLayoutSpec(
			direction: .Vertical,
			spacing: 2,
			justifyContent: .Center,
			alignItems: .Stretch,
			children: [dotStack, textNode])
	}
}


enum GuideFooterItem: Int {
	case Cover
	case See
	case Do
	case Eat
	case Stay

	var localizedName: String {
		switch self {
		case .Cover:
			return NSLocalizedString("COVER", comment: "")
		case .See:
			return NSLocalizedString("SEE", comment: "")
		case .Do:
			return NSLocalizedString("DO", comment: "")
		case .Eat:
			return NSLocalizedString("EAT", comment: "")
		case .Stay:
			return NSLocalizedString("STAY", comment: "")
		}
	}

	var recType: RecType? {
		switch self {
		case .Cover:
			return nil
		case .See:
			return .See
		case .Do:
			return .Do
		case .Eat:
			return .Eat
		case .Stay:
			return .Stay
		}
	}

	static let all: [GuideFooterItem] = [GuideFooterItem.Cover, GuideFooterItem.See, GuideFooterItem.Do, GuideFooterItem.Eat, GuideFooterItem.Stay]
}