//
//  GuideRecViewController.swift
//  TripstrThree
//
//  Created by Adlai Holler on 2/21/16.
//  Copyright © 2016 tripstr. All rights reserved.
//

import AsyncDisplayKit

final class GuideRecViewController: ASViewController {
	struct State {
		var rec: Rec
	}
	var state: State

	var scrollNode: GuideRecScrollNode {
		return node as! GuideRecScrollNode
	}

	var recNode: GuideRecNode {
		return scrollNode.recNode
	}

	init(rec: Rec) {
		self.state = State(rec: rec)
		super.init(node: GuideRecScrollNode(rec: rec))
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}
