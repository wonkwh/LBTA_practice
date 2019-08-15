//
//  NodeController.swift
//  LBTAToolsStacking
//
//  Created by wonkwh on 2019/08/15.
//

import AsyncDisplayKit
class SimpleVStackCellNode: ASCellNode {
    
    let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = #imageLiteral(resourceName: "girl.png")
        node.contentMode = .scaleAspectFill
        return node
    }()
    
    let nameTextNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(string: "Girl")
        return node
    }()
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func didLoad() {
        layer.borderWidth = 0.5
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        imageNode.style.preferredSize = CGSize(width: 80, height: 80)
//        let layout = ASStackLayoutSpec(direction: .vertical,
//                                       spacing: 8.0,
//                                       justifyContent: .start,
//                                       alignItems: .center,
//                                       children: [imageNode, nameTextNode])
//      return layout
        return stack(imageNode.withSize(.init(width: 80, height: 80)),
            nameTextNode, spacing: 8, alignment: .center)
//        return stack(imageNode.withSize(.init(width: 80, height: 80)),
//                     nameTextNode,
//                     alignment: .center)
    }
}

class HStackingCellNode: ASCellNode {
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.backgroundColor = .red
    }
}

class StackingWithMarginsCellNode: ASCellNode {
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.backgroundColor = .green
    }
}


class ViewNodeController: ASViewController<ASDisplayNode> {
    
    let collectionNode: ASCollectionNode = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
        let collection = ASCollectionNode(collectionViewLayout: layout)
        collection.automaticallyManagesSubnodes = true
        return collection
    }()
    
    init() {
        super.init(node: collectionNode)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionNode.dataSource = self
        collectionNode.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewNodeController: ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 3 }
        return 1
    }
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 3
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            if indexPath.section == 0 {
                return SimpleVStackCellNode()
            } else if indexPath.section == 1 {
                return HStackingCellNode()
            } else {
                return StackingWithMarginsCellNode()
            }
        }
    }
}

extension ViewNodeController: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        var size: CGSize = .zero
        if indexPath.section == 0 {
            size = CGSize(width: (view.frame.width - 16 * 4) / 3, height: 120)
        } else if indexPath.section == 1 {
            size = CGSize(width: view.frame.width - 16 * 2, height: 100)
        } else {
            size = CGSize(width: view.frame.width - 16 * 2 , height: 400)
        }
        return ASSizeRange(min: size, max: size)
    }
}


