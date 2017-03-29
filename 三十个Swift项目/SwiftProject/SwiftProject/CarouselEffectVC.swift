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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
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
        
        let collectionViewLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.width - kItemSpace * 3, height: collectionView.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: kItemSpace, height: collectionView.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: kItemSpace, height: collectionView.height)
    }
    
}
