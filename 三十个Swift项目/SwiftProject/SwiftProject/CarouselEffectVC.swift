//
//  CarouselEffectVC.swift
//  SwiftProject
//
//  Created by zhangbinbin on 2017/3/29.
//  Copyright © 2017年 zhangbinbin. All rights reserved.
//

import UIKit

struct DetailInfo {
    var description : String!
    var image : UIImage!
}

private let kItemSpace : CGFloat = 20

class CarouselEffectVC: UIViewController,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout{
    
    var collectionView : UICollectionView! // 自动解析
    var dataArray : Array<DetailInfo>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 会隐藏整个navigationController pop不回去了
        //        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView.init(frame: self.view.bounds)
        backgroundImageView.image = #imageLiteral(resourceName: "1")
        self.view.addSubview(backgroundImageView)
        
        // 毛玻璃效果
        let visualEffectView = UIVisualEffectView.init(frame: self.view.bounds)
        visualEffectView.frame = self.view.bounds
        visualEffectView.effect = UIBlurEffect.init(style: UIBlurEffectStyle.light)
        self.view.addSubview(visualEffectView)
        
        dataArray = [DetailInfo.init(description: "", image: #imageLiteral(resourceName: "3")),
                     DetailInfo.init(description: "", image: #imageLiteral(resourceName: "6")),
                     DetailInfo.init(description: "", image: #imageLiteral(resourceName: "4")),
                     DetailInfo.init(description: "", image: #imageLiteral(resourceName: "2")),
                     DetailInfo.init(description: "", image: #imageLiteral(resourceName: "5"))]
        
        let collectionViewLayout : CustomCollectionViewLayout = CustomCollectionViewLayout.init()
        
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        collectionViewLayout.minimumLineSpacing = kItemSpace
        
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 100, width: self.view.width, height: 500),
                                               collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // UICollectionViewCell.self get class name
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = UIColor.clear
        
        visualEffectView.contentView.addSubview(collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                                             for: indexPath)
        
        
        let imageView = UIImageView.init(image: dataArray[indexPath.row].image)
        cell.contentView.addSubview(imageView)
        imageView.frame = cell.contentView.bounds
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize.init(width: collectionView.width - kItemSpace * 3, height: collectionView.height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize.init(width: kItemSpace, height: collectionView.height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize.init(width: kItemSpace, height: collectionView.height)
//    }
    
}

class CustomCollectionViewLayout: UICollectionViewFlowLayout {
    
    var width : CGFloat {
        get{
            let collectionView = self.collectionView
            let width = ((collectionView?.width)! - 4*kItemSpace)
            return width
        }
    }
    
    // 实现自定义布局需要继承UICollectionViewLayout，同时还要重载下面的三个方法
    
    // 内容区域总大小，不是可见区域
    override var collectionViewContentSize: CGSize {
        let collectionView = self.collectionView
        
        let contentWidth =  self.width * CGFloat((collectionView?.numberOfItems(inSection: 0))!)
        let height = collectionView?.height
        
        return CGSize.init(width: contentWidth + kItemSpace, height: height!)
    }
    
    // 所有单元格位置属性
    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
        
            var attributesArray = [UICollectionViewLayoutAttributes]()
            let cellCount = self.collectionView!.numberOfItems(inSection: 0)
            for i in 0..<cellCount {
                let indexPath =  IndexPath(item:i, section:0)
                let attributes =  self.layoutAttributesForItem(at: indexPath)
                attributesArray.append(attributes!)
            }
            return attributesArray
    }
    
    // 这个方法返回每个单元格的位置和大小
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let collectionView = self.collectionView
        
        let width : CGFloat = self.width
        let x : CGFloat = width * CGFloat(indexPath.item) + kItemSpace
        let height : CGFloat = (collectionView?.height)!

        let layoutAttributes = UICollectionViewLayoutAttributes(forCellWith:indexPath)
        layoutAttributes.frame = CGRect.init(x: x, y: 0, width: width - kItemSpace, height: height)
        
        return layoutAttributes
    }
    
    // 滚动时实时修改
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // 预计结束时候的位置
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var targetContentOffset = proposedContentOffset
        
//        print(ceil(targetContentOffset.x / self.width))
        targetContentOffset.x = ceil(targetContentOffset.x / self.width) * self.width - kItemSpace

        return targetContentOffset
    }
}

















