//
//  UIView+Frame.swift
//  SwiftProject
//
//  Created by zhangbinbin on 2017/3/28.
//  Copyright © 2017年 zhangbinbin. All rights reserved.
//

import UIKit

extension UIView {
    var x : CGFloat {return self.frame.origin.x}
    var y : CGFloat {return self.frame.origin.y}
    var width : CGFloat {return self.bounds.size.width}
    var height : CGFloat {return self.bounds.size.height}
}
