//
//  ASStackView+.swift
//  LBTAToolsStacking
//
//  Created by wonkwh on 2019/08/15.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import AsyncDisplayKit

extension ASStackLayoutSpec {
    
    @discardableResult
    open func withMargins(_ margins: UIEdgeInsets) -> ASStackLayoutSpec {
        //layoutMargins = margins
        //isLayoutMarginsRelativeArrangement = true
        return self
    }
/*
    @discardableResult
    open func padLeft(_ left: CGFloat) -> ASStackLayoutSpec {
//        isLayoutMarginsRelativeArrangement = true
//        layoutMargins.left = left
        return self
    }
    
    @discardableResult
    open func padTop(_ top: CGFloat) -> ASStackLayoutSpec {
//        isLayoutMarginsRelativeArrangement = true
//        layoutMargins.top = top
     
        return ASInsetLayoutSpec(insets: .init(top: top, left: 0, bottom: 0, right: 0),
                          child: self)
//        return self
    }
    
    @discardableResult
    open func padBottom(_ bottom: CGFloat) -> ASStackLayoutSpec {
//        isLayoutMarginsRelativeArrangement = true
//        layoutMargins.bottom = bottom
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: bottom, right: 0),
                          child: self)

//        return self
    }
    
    @discardableResult
    open func padRight(_ right: CGFloat) -> ASStackLayoutSpec {
//        isLayoutMarginsRelativeArrangement = true
//        layoutMargins.right = right
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: right),
                                 child: self)

        return self
    }
 */
}
