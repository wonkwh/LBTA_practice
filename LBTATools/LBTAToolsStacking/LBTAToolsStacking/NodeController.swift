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
        node.cornerRoundingType = .precomposited
        node.cornerRadius = 40
        return node
    }()
    
    let nameTextNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(string: "Girl Macguqqqq")
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
        
        let layout = stack(imageNode.withSize(.init(width: 80, height: 80)),
                           nameTextNode.padTop(8),
                           alignment: .center).padTop(8)
        return layout
//        return stack(imageNode.withSize(.init(width: 80, height: 80)),
//                     nameTextNode,
//                     alignment: .center)
    }
}

class HStackingCellNode: ASCellNode {
    
    let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = #imageLiteral(resourceName: "girl.png")
        node.contentMode = .scaleAspectFill
        node.cornerRoundingType = .precomposited
        node.cornerRadius = 40
        return node
    }()
    
    let nameTextNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(string: "Girl Macguqqqq")
        return node
    }()
    
    let messageTexNodet: ASTextNode = {
        let text = ASTextNode()
        let msg = "이것은 긴 텍스트입니다.  어젯밤에 잘잤니. 담에 또 볼레. \n꺼져 그얼굴로 뭘 보겠다는거냐"
        let attribute = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
                         NSAttributedString.Key.foregroundColor : UIColor.gray]
        text.attributedText = NSAttributedString(string: msg,
                                                 attributes: attribute)
        text.maximumNumberOfLines = 2
        return text
    }()

    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func didLoad() {
        layer.borderWidth = 0.5
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = hstack(imageNode.withSize(.init(width: 60, height: 60)),
                            stack(nameTextNode, messageTexNodet).spacing(6))
                    .spacing(16)
                    .distribution(.start).alignment(.center).withMargins(.allSides(side: 12))
        
        return layout
    }
}

class StackingWithMarginsCellNode: ASCellNode {
    
    let imageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = #imageLiteral(resourceName: "girl.png")
        node.contentMode = .scaleAspectFill
        return node
    }()
    
    let nameTextNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText = NSAttributedString(string: "Girl Macguqqqq")
        return node
    }()
    
    let messageTexNodet: ASTextNode = {
        let text = ASTextNode()
        let msg = "이것은 긴 텍스트입니다.  어젯밤에 잘잤니. 담에 또 볼레. \n꺼져 그얼굴로 뭘 보겠다는거냐"
        let attribute = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
                         NSAttributedString.Key.foregroundColor : UIColor.gray]
        text.attributedText = NSAttributedString(string: msg,
                                                 attributes: attribute)
        text.maximumNumberOfLines = 2
        return text
    }()

    let explore: ASButtonNode = {
        let node = ASButtonNode()
        node.titleNode.attributedText = NSAttributedString(string: "Explore")
        return node
    }()
    
    let arrorImageNode: ASImageNode = {
        let node = ASImageNode()
        node.image = #imageLiteral(resourceName: "girl")
        return node
    }()
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
    override func didLoad() {
        layer.borderWidth = 2
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let embedHStack = hstack(explore, arrorImageNode.withWidth(12).withHeight(12)).spacing(8)
        let embedStack = stack(nameTextNode, messageTexNodet,Divider.withHeight(70),embedHStack, spacing: 8)
                            .alignment(.start)
                            .withMargins(.allSides(side: 12))

        let layout = stack(imageNode.withHeight(200), embedStack,
                    spacing: 16)
        return layout
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


