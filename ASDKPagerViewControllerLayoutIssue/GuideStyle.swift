
import UIKit

struct Colors {
	static let guideDarkText = UIColor(hexString: "515C62")!

	static let guideLightText = UIColor(hexString: "848E94")!
}

struct GuideStyle {
	static let seeDoEatStayAttr: StringAttributes = [
		NSFontAttributeName: UIFont.systemFontOfSize(11, weight: UIFontWeightMedium),
		NSForegroundColorAttributeName: Colors.guideDarkText,
		NSKernAttributeName: -0.27
	]

	static let headerInset = UIEdgeInsets(horizontal: 4, vertical: 4)

	static let coverTitleAttr: StringAttributes = [
		NSFontAttributeName: UIFont.systemFontOfSize(12, weight: UIFontWeightMedium),
		NSForegroundColorAttributeName: UIColor.whiteColor(),
		NSKernAttributeName: -0.27
	]

	static let captionAttr: StringAttributes = [
		NSFontAttributeName: UIFont.systemFontOfSize(13, weight: UIFontWeightRegular),
		NSForegroundColorAttributeName: Colors.guideDarkText,
		NSKernAttributeName: -0.12
	]

	static let poiNameAttr: StringAttributes = [
		NSFontAttributeName: UIFont.systemFontOfSize(14, weight: UIFontWeightMedium),
		NSForegroundColorAttributeName: Colors.guideDarkText,
		NSKernAttributeName: -0.32
	]

	static let poiCategoryAttr: StringAttributes = [
		NSFontAttributeName: UIFont.systemFontOfSize(12, weight: UIFontWeightMedium),
		NSForegroundColorAttributeName: Colors.guideLightText,
		NSKernAttributeName: -0.19
	]

	static let headerWhileInAttr: StringAttributes = [
		NSFontAttributeName: UIFont.systemFontOfSize(13, weight: UIFontWeightMedium),
		NSForegroundColorAttributeName: Colors.guideLightText,
		NSKernAttributeName: -0.32
	]

	static let headerCityAttr: StringAttributes = [
		NSFontAttributeName: UIFont.systemFontOfSize(13, weight: UIFontWeightMedium),
		NSForegroundColorAttributeName: Colors.guideDarkText,
		NSKernAttributeName: -0.32
	]

	static let headerUsernameAttr: StringAttributes = [
		NSFontAttributeName: UIFont.systemFontOfSize(13, weight: UIFontWeightMedium),
		NSForegroundColorAttributeName: Colors.guideDarkText,
		NSKernAttributeName: -0.32
	]

}
