//
//  ImageExtension.swift
//  ImageExtension
//
//  Created by JingZhao_R on 2019/10/21.
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
    /// - Parameter backgroundSize: 背景图片尺寸 默认 86*86
    /// - Parameter image: 上层图片
    /// - Parameter imageSize: 上层图片尺寸 默认 50*50
    public static func compare(backgroundImage: UIImage?, backgroundSize: CGSize = CGSize(width: 86, height: 86), image: UIImage?, imageSize: CGSize = CGSize(width: 50, height: 50)) -> UIImage? {
        guard let background = backgroundImage else {
            fatalError("backgroundImage not found")
        }
        let bgImgRef = UIImage.scale(toSize: background, size: backgroundSize)!.cgImage
        let bgImgW = CGFloat(bgImgRef!.width)
        let bgImgH = CGFloat(bgImgRef!.height)
        
        guard let image = image else {
            fatalError("image not found")
        }
        let imgRef = UIImage.scale(toSize: image, size: imageSize)!.cgImage
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
    public static func scale(toSize img: UIImage?, size newsize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(newsize)
        img?.draw(in: CGRect(x: 0, y: 0, width: newsize.width, height: newsize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }

}
