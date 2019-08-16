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
    open func alignment(_ alignment: ASStackLayoutAlignItems = .stretch) -> ASStackLayoutSpec {
        self.alignItems = alignment
        return self
    }

    @discardableResult
    open func spacing(_ value: CGFloat) -> ASStackLayoutSpec {
        self.spacing = value
        return self
    }

    @discardableResult
    open func distribution(_ justify: ASStackLayoutJustifyContent = .start) -> ASStackLayoutSpec {
        self.justifyContent = justify
        return self
    }
}

extension ASLayoutSpec {
    
    @discardableResult
    open func withMargins(_ margins: UIEdgeInsets) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .init(top: margins.top, left: margins.left,
                                               bottom: margins.bottom, right: margins.right),
                                 child: self)
    }

    @discardableResult
    open func padLeft(_ left: CGFloat) -> ASLayoutSpec {
//        isLayoutMarginsRelativeArrangement = true
//        layoutMargins.left = left
        
        return self
    }
    
    @discardableResult
    open func padTop(_ top: CGFloat) -> ASLayoutSpec {
//        isLayoutMarginsRelativeArrangement = true
//        layoutMargins.top = top
     
        return ASInsetLayoutSpec(insets: .init(top: top, left: 0, bottom: 0, right: 0),
                          child: self)
//        return self
    }
    
    @discardableResult
    open func padBottom(_ bottom: CGFloat) -> ASLayoutSpec {
//        isLayoutMarginsRelativeArrangement = true
//        layoutMargins.bottom = bottom
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: bottom, right: 0),
                          child: self)

//        return self
    }
    
    @discardableResult
    open func padRight(_ right: CGFloat) -> ASLayoutSpec {
//        isLayoutMarginsRelativeArrangement = true
//        layoutMargins.right = right
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: right),
                                 child: self)

//        return self
    }
}
