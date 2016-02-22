//
//  GuideViewController.swift
//  TripstrThree
//
//  Created by Adlai Holler on 2/21/16.
//  Copyright © 2016 tripstr. All rights reserved.
//

import AsyncDisplayKit

/**
The view controller responsible for managing the entire presentation of 
a guide, at the top level
*/
final class GuideViewController: ASViewController, ASPagerNodeDataSource {

	var guideNode: GuideNode {
		return node as! GuideNode
	}

	struct State {
		var guide: Guide
	}

	/// This will only ever change on the main queue.
	var state: State

	init(guide: Guide) {
		self.state = State(guide: guide)
		super.init(node: GuideNode(guide: guide))
		guideNode.pager.setDataSource(self)
		for item in guideNode.footer.items {
			item.addTarget(self, action: "didTapFooterItemNode:", forControlEvents: .TouchUpInside)
		}
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}

	private let lastNodeBoundsLock = NSLock()
	private var lastNodeBounds: CGRect = .zero
	override func viewWillLayoutSubviews() {
		lastNodeBoundsLock.lock()
		lastNodeBounds = view.bounds
		lastNodeBoundsLock.unlock()
		super.viewWillLayoutSubviews()
	}

	// MARK: Event Handling

	@objc private func didTapFooterItemNode(node: GuideFooterItemNode) {
		// Scroll user to first or last page for that type, whichever's closer.
		guard let currentPage = currentPageIndex() else { return }
		guard let tappedRecType = node.item.recType else {
			guideNode.pager.scrollToPageAtIndex(0, animated: true)
			return
		}
		guard let range = pageRangeForType(tappedRecType) else {
			return
		}
		if let first = range.first where first > currentPage {
			guideNode.pager.scrollToPageAtIndex(first, animated: true)
		} else if let last = range.last where last < currentPage {
			guideNode.pager.scrollToPageAtIndex(last, animated: true)
		}
	}

	// MARK: ASPagerNodeDataSource
	
	func pagerNode(pagerNode: ASPagerNode!, nodeBlockAtIndex index: Int) -> ASCellNodeBlock! {
		if index == 0 {
			let guide = state.guide
			return { GuideCoverNode(guide: guide) }
		} else {
			let rec = state.guide.recs[index - 1]
			return {
				ASCellNode(
					viewControllerBlock: { GuideRecViewController(rec: rec) },
					didLoadBlock: { _ in () })
			}
		}
	}

	func numberOfPagesInPagerNode(pagerNode: ASPagerNode!) -> Int {
		return state.guide.recs.count + 1
	}

	func pagerNode(pagerNode: ASPagerNode!, constrainedSizeForNodeAtIndexPath indexPath: NSIndexPath!)
		-> ASSizeRange {
		lastNodeBoundsLock.lock()
		let width = lastNodeBounds.width
		lastNodeBoundsLock.unlock()
		return ASSizeRange(
			min: CGSize(
				width: width,
				height: 299),
			max: CGSize(
				width: width,
				height: 300)
		)
	}

	// MARK: Internal API

	func currentPageIndex() -> Int? {
		let pager = guideNode.pager
		let centerPt = pager.convertPoint(node.bounds.center, fromNode: node)
		return pager.view.indexPathForItemAtPoint(centerPt)?.item
	}

	/// Returns the range of pages that correspond to the given rec type, or nil if none do.
	func pageRangeForType(type: RecType) -> Range<Int>? {
		let recs = state.guide.recs
		let firstIndexOrNil: Int? = recs.indexOf { $0.type == type }.flatMap { $0 + 1 }
		let lastIndexOrNil: Int? = recs.lastIndexOf { $0.type == type }.flatMap { $0 + 1 }
		if let first = firstIndexOrNil, last = lastIndexOrNil {
			return first...last
		} else {
			return nil
		}
	}
}
