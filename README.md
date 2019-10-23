# RImageEx

[![CI Status](https://img.shields.io/travis/chaopengCoder/RImageEx.svg?style=flat)](https://travis-ci.org/chaopengCoder/RImageEx)
[![Version](https://img.shields.io/cocoapods/v/RImageEx.svg?style=flat)](https://cocoapods.org/pods/RImageEx)
[![License](https://img.shields.io/cocoapods/l/RImageEx.svg?style=flat)](https://cocoapods.org/pods/RImageEx)
[![Platform](https://img.shields.io/cocoapods/p/RImageEx.svg?style=flat)](https://cocoapods.org/pods/RImageEx)

## Example

项目中包括 

1. 根据颜色生成UIImage对象
```swift
let backgroundImage = UIImage.image(color: UIColor.red)
```
2. 合并两张UIImage为一张, 图片不会变形, 只需要传入两张UIImage, 以及各自的合成后的最长边尺寸, 默认背景图最长边是86, 合成在背景图上的图片最长边是50

```swift
let backgroundImage = UIImage.image(color: UIColor.red)
let topImage = UIImage.image(color: UIColor.gray)
// 默认大小
let defaultCompareImage = UIImage.compare(backgroundImage: backgroundImage, image: topImage)
// 自定义大小
let customCompareImage = UIImage.compare(backgroundImage: backgroundImage, backgroundMaxSide: 100, image: topImage, imageMaxSide: 40)
```

## Requirements

## Installation

RImageEx is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RImageEx'
```

## Author

chaopengCoder, chaopeng_coder@qq.com

## License

RImageEx is available under the MIT license. See the LICENSE file for more info.
