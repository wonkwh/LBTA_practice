//
//  ASDisplayNode+Stacking.swift
//  LBTAToolsStacking
//
//  Created by wonkwh on 2019/08/15.
//

import AsyncDisplayKit

let Divider = ASDisplayNode()

extension ASDisplayNode {
    
    fileprivate func _stack(_ direction: ASStackLayoutDirection = .vertical,
                            nodes: [ASLayoutElement],
                            spacing: CGFloat = 0,
                            alignment: ASStackLayoutAlignItems) -> ASStackLayoutSpec {
//        let stackView = UIStackView(arrangedSubviews: views)
        
          let stackView = ASStackLayoutSpec()
        stackView.direction = direction
        stackView.alignItems = alignment
        stackView.spacing = spacing
        stackView.children = nodes
        stackView.justifyContent = .start
//        stackView.axis = axis
//        stackView.spacing = spacing
//        stackView.alignment = alignment
//        addSubview(stackView)
//        stackView.fillSuperview()
        return stackView
    }
    
    @discardableResult
    open func stack(_ nodes: ASLayoutElement...,
        spacing: CGFloat = 0,
        alignment: ASStackLayoutAlignItems = .stretch) -> ASStackLayoutSpec {
        return _stack(.vertical, nodes: nodes, spacing: spacing, alignment: alignment)
    }
    
    @discardableResult
    open func hstack(_ nodes: ASLayoutElement..., spacing: CGFloat = 0, alignment: ASStackLayoutAlignItems = .stretch) -> ASStackLayoutSpec {
        return _stack(.horizontal, nodes: nodes, spacing: spacing, alignment: alignment)
    }
    
    @discardableResult
    open func withSize<T: ASDisplayNode>(_ size: CGSize) -> T {
        style.preferredSize = size
        return self as! T
    }
    
    @discardableResult
    open func withHeight(_ height: CGFloat) -> ASDisplayNode {
        style.preferredSize.height = height
        return self
    }
    
    @discardableResult
    open func withWidth(_ width: CGFloat) -> ASDisplayNode {
        style.preferredSize.width = width
        return self
    }
    
    @discardableResult
    func withBorder(width: CGFloat, color: UIColor) -> ASDisplayNode {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self
    }
    
    @discardableResult
    open func padTop(_ top: CGFloat) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .init(top: top, left: 0, bottom: 0, right: 0),
                                 child: self)
    }

    open func padBottom(_ bottom: CGFloat) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom:bottom , right: 0),
                                 child: self)
    }

    open func padLeft(_ left: CGFloat) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .init(top: 0, left: left, bottom: 0, right: 0),
                                 child: self)
    }
    
    open func padRight(_ right: CGFloat) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: right),
                                 child: self)
    }
}

extension UIEdgeInsets {
    static public func allSides(side: CGFloat) -> UIEdgeInsets {
        return .init(top: side, left: side, bottom: side, right: side)
    }
}

extension UIImageView {
    convenience public init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.init(image: image)
        self.contentMode = contentMode
        self.clipsToBounds = true
    }
}

