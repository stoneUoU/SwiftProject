

import UIKit

extension String {
    
    /// 检验手机号
    func isTelNumber()->Bool
        
    {
        
        let mobile = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
        
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        if ((regextestmobile.evaluate(with: self))
            || (regextestcm.evaluate(with: self))
            || (regextestct.evaluate(with: self))
            || (regextestcu.evaluate(with: self))){
            return true
        }else {
            return false
        }
    }
    
    func textHeight(_ text:NSString,textWidth:CGFloat,font:UIFont) -> CGFloat {
        let size = CGSize(width: textWidth, height: CGFloat(MAXFLOAT))
        let height:CGFloat = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font], context: nil).size.height
        return height
    }
    
    func replacePhone() -> String {
        if !HiRegularHelper.mobileIsValidated(vStr: self) {
            return self;
        } else {
            let start = self.index(self.startIndex, offsetBy: 3)
            let end = self.index(self.startIndex, offsetBy: 7)
            let range = Range(uncheckedBounds: (lower: start, upper: end))
            return self.replacingCharacters(in: range, with: "****")
        }
    }
}

