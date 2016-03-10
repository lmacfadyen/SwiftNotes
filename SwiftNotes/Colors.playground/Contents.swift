
import UIKit

// Use Structs
struct CustomColors {
    static let chevyOrangeColor = UIColor(red:225.0/255.0, green:50.0/255.0, blue:29.0/255.0, alpha:1);
    
    struct Blue {
        static let skyBlueColor = UIColor(red:0.0/255.0, green:169.0/255.0, blue:199.0/255.0, alpha:1);
        static let twitterBlueColor = UIColor(red:75.0/255.0, green:163.0/255.0, blue:235.0/255.0, alpha:1);
    }
}

// Use an extension
extension UIColor {
    
    class func customChevyOrangeColor() -> UIColor {
        return UIColor(red:225.0/255.0, green:50.0/255.0, blue:29.0/255.0, alpha:1);
    }
    class func customSkyBlueColor() -> UIColor {
        return UIColor(red:0.0/255.0, green:169.0/255.0, blue:199.0/255.0, alpha:1);
        
    }
    class func customTwitterColor() -> UIColor {
        return UIColor(red:75.0/255.0, green:163.0/255.0, blue:235.0/255.0, alpha:1);
    }
}

let orange = CustomColors.chevyOrangeColor
let alsoOrange = UIColor.customChevyOrangeColor()

let skyBlue = CustomColors.Blue.skyBlueColor
let alsoSkyBlue = UIColor.customSkyBlueColor()

let twitterBlue = CustomColors.Blue.twitterBlueColor
let alsoTwitterBlue = UIColor.customTwitterColor()


