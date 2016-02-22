//
//  Guide.swift
//  TripstrThree
//
//  Created by Adlai Holler on 2/20/16.
//  Copyright © 2016 tripstr. All rights reserved.
//

import Foundation

typealias GuideUUID = String

struct Guide {

	var recs: [Rec]
	var title: String?
	var published: Bool
	var city: City
	var creator: User

	var recsByType: [RecType: [Rec]] {
		var dict: [RecType: [Rec]] = [:]
		for rec in recs {
			let type = rec.type
			if let _ = dict[type] {
				dict[type]!.append(rec)
			} else {
				dict[type] = [ rec ]
			}
		}
		return dict
	}
}

extension Guide {
	static let test = Guide(
		recs: [
			Rec(caption: "An awesome spot for lunch!",
				type: .Eat,
				poi: POI(
					name: "The Queen's Bar",
					categoryName: "Bar")),
			Rec(caption: "A solid hotel",
				type: .Stay,
				poi: POI(
					name: "The Queen's Hotel",
					categoryName: "Hotel")),
			Rec(caption: "Always wanted to try a room escape!",
				type: .Do,
				poi: POI(
					name: "The Beefeater's Room Escape",
					categoryName: "Dungeon")),
			Rec(caption: "Top 5 Ferris wheels, easily.",
				type: .See,
				poi: POI(
					name: "The London Eye",
					categoryName: "Ferris Wheel"))
		],
		title: "My Guide!",
		published: false,
		city: City(name: "London, UK"),
		creator: User(username: "adlai"))
}