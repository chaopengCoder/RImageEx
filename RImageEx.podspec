#
# Be sure to run `pod lib lint RImageEx.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RImageEx'
  s.version          = '1.0.5'
  s.summary          = 'Swift UIImage扩展,图片合成等'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/chaopengCoder/RImageEx'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chaopengCoder' => 'chaopeng_coder@qq.com' }
  s.source           = { :git => 'https://github.com/chaopengCoder/RImageEx.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.source_files = 'RImageEx/**/*'
  
  s.frameworks = 'UIKit'
end
