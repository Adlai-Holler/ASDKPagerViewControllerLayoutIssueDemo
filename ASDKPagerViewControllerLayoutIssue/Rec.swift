//
//  Rec.swift
//  TripstrThree
//
//  Created by Adlai Holler on 2/20/16.
//  Copyright © 2016 tripstr. All rights reserved.
//

import Foundation
import CoreData

enum RecType: String {
	case See = "see"
	case Stay = "stay"
	case Do = "do"
	case Eat = "eat"

	var index: Int {
		switch self {
		case .See:
			return 0
		case .Do:
			return 1
		case .Eat:
			return 2
		case .Stay:
			return 3
		}
	}
}

typealias RecUUID = String

struct Rec {

	var caption: String?
	var type: RecType

	var poi: POI
}
