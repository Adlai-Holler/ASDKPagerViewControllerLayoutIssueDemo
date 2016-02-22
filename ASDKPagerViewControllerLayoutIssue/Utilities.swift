//
//  Utilities.swift
//  ASDKPagerViewControllerLayoutIssue
//
//  Created by Adlai Holler on 2/22/16.
//  Copyright © 2016 adlai. All rights reserved.
//

import Foundation
import UIKit

extension CollectionType {
	/// Returns the last index where `predicate` returns `true` for the
	/// corresponding value, or `nil` if such value is not found.
	///
	/// - Complexity: O(`self.count`).
	@warn_unused_result
	func lastIndexOf(@noescape predicate: (Self.Generator.Element) throws -> Bool) rethrows -> Self.Index? {
		for i in indices.reverse() where try predicate(self[i]) {
			return i
		}
		return nil
	}
}

extension CGRect {
	var center: CGPoint {
		return CGPoint(x: midX, y: midY)
	}
}


typealias StringAttributes = [String: AnyObject]

extension String {

	func attributed(attributes: StringAttributes? = nil) -> NSAttributedString {
		return NSAttributedString(string: self, attributes: attributes)
	}

	/**
	NOTE: Prefer the immutable variant – immutable attributed strings
	are never copied
	*/
	func attributedMutable(attributes: StringAttributes) -> NSMutableAttributedString {
		return NSMutableAttributedString(string: self, attributes: attributes)
	}
}

func +=(lhs: NSMutableAttributedString, rhs: NSAttributedString) {
	lhs.appendAttributedString(rhs)
}

extension UIEdgeInsets {
	init(horizontal: CGFloat, vertical: CGFloat) {
		self = UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
	}
}

extension UIColor {
	// Creates a UIColor from a Hex string.
	public convenience init?(hexString: String) {
		var cString:NSString = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString

		if (cString.hasPrefix("#")) {
			cString = cString.substringFromIndex(1)
		}

		if (cString.length != 6) {
			self.init()
			return nil
		}

		let rString = cString.substringToIndex(2)
		let gString = cString.substringWithRange(NSMakeRange(2, 2))
		let bString = cString.substringWithRange(NSMakeRange(4, 2))

		var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
		NSScanner(string: rString).scanHexInt(&r)
		NSScanner(string: gString).scanHexInt(&g)
		NSScanner(string: bString).scanHexInt(&b)
		self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)
	}
}