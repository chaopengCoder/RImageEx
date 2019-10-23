//
//  ImageExtension.swift
//  ImageExtension
//
//  Created by chaopeng_coder on 2019/10/21.
//

import UIKit

extension UIImage {
    /// 根据色值生成UIImage
    /// - Parameter color: 颜色
    /// - Parameter size: 图片指定大小, 默认 50*50
    public static func image(color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 合并两张图片为一张
    /// - Parameter backgroundImage: 背景图片
    /// - Parameter backgroundMaxSide: 背景图片最长边值
    /// - Parameter image: 上层图片
    /// - Parameter imageMaxSide: 上层图片最长边值
    public static func compare(backgroundImage: UIImage?, backgroundMaxSide: CGFloat = 86, image: UIImage?, imageMaxSide: CGFloat = 50) -> UIImage? {
        guard let background = backgroundImage else {
            fatalError("backgroundImage not found")
        }
        let bgImgRef = UIImage.scale(image: background, maxSide: backgroundMaxSide)?.cgImage
        let bgImgW = CGFloat(bgImgRef!.width)
        let bgImgH = CGFloat(bgImgRef!.height)
        
        guard let image = image else {
            fatalError("image not found")
        }
        let imgRef = UIImage.scale(image: image, maxSide: imageMaxSide)?.cgImage
        let imgW = CGFloat(imgRef!.width)
        let imgH = CGFloat(imgRef!.height)
        
        let x = (bgImgW - imgW) / 2
        let y = (bgImgH - imgH) / 2
        UIGraphicsBeginImageContext(CGSize(width: bgImgW, height: bgImgH))
        background.draw(in: CGRect(x: 0, y: 0, width: bgImgW, height: bgImgH))
        image.draw(in: CGRect(x: x, y: y, width: imgW, height: imgH))
        let resultImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImg
    }
    
    /// 修改图片尺寸
    /// - Parameter img: 图片
    /// - Parameter newsize: 新尺寸
    
    public static func scale(image: UIImage?, maxSide: CGFloat = 50) -> UIImage? {
        
        guard let image = image else {
            fatalError("需要缩放的图片源不存在")
        }
        
        let imgW = image.size.width
        let imgH = image.size.height
        let imgScale = imgH / imgW
        
        var newW = maxSide
        var newH = maxSide
        if imgH > imgW {
            newW = maxSide / imgScale
        } else {
            newH = maxSide * imgScale
        }
        
        let newSize = CGSize(width: newW, height: newH)
        
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newW, height: newH))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }

}
