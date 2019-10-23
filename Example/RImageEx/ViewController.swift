//
//  ViewController.swift
//  RImageEx
//
//  Created by chaopengCoder on 10/23/2019.
//  Copyright (c) 2019 chaopengCoder. All rights reserved.
//

import UIKit
import RImageEx

class ViewController: UIViewController {

    fileprivate lazy var defaultImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: (UIScreen.main.bounds.width - 86) / 2, y: 100, width: 86, height: 86)
        return img
    }()
    
    fileprivate lazy var customImageView: UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: (UIScreen.main.bounds.width - 100) / 2, y: 200, width: 100, height: 100)
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 根据颜色生成图片
        let backgroundImage = UIImage.image(color: UIColor.red)
        
        /// 根据颜色生成图片
        let topImage = UIImage.image(color: UIColor.gray)
        
        /// 合并两张图片 默认 背景图的最长边默认是86, 顶部图最长边默认是50
        let defaultCompareImage = UIImage.compare(backgroundImage: backgroundImage, image: topImage)
        
        /// 自定义最长边
        let customCompareImage = UIImage.compare(backgroundImage: backgroundImage, backgroundMaxSide: 100, image: topImage, imageMaxSide: 40)
        
        
        defaultImageView.image = defaultCompareImage
        customImageView.image = customCompareImage
        
        
        self.view.addSubview(defaultImageView)
        self.view.addSubview(customImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

