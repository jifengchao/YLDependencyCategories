#
# Be sure to run `pod lib lint YLDependencyCategories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLDependencyCategories'
  s.version          = '0.1.4'
  s.summary          = 'YLDependencyCategories component'

  s.homepage         = 'https://github.com/jifengchao/YLDependencyCategories'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jifengchao' => '965524749@qq.com' }

  s.ios.deployment_target = '9.0'

  # s.source           = { :path => '.' }
  s.source           = { :git => 'https://github.com/jifengchao/YLDependencyCategories.git', :tag => s.version.to_s }
  s.source_files = "YLDependencyCategories/YLDependencyCategories.h"
  
  # s.requires_arc     = true
    
  # s.dependency 'JKCategories', '1.9.2'
  # s.dependency 'ZXingObjC', '3.2.2'
  # s.dependency 'GKPhotoBrowser/SD', '2.2.1'
  # s.dependency 'SDWebImage', '5.11.1'



  #WHC_Debuger
  s.subspec 'WHC_Debuger' do |debuger|
      debuger.source_files = 'YLDependencyCategories/WHC_Debuger/*'
  end


  #Foundation
  s.subspec 'Foundation' do |foundation|
      foundation.public_header_files = 'YLDependencyCategories/YLDependencyCategories/Foundation/YLDependencyFoundation.h'
      foundation.source_files = 'YLDependencyCategories/YLDependencyCategories/Foundation/YLDependencyFoundation.h'
      foundation.frameworks = 'Foundation','AdSupport'

      #三级
      foundation.subspec 'NSObject' do |object|
          object.source_files = 'YLDependencyCategories/YLDependencyCategories/Foundation/NSObject/*.{h,m}'
          object.dependency 'JKCategories', '1.9.2'
      end
      foundation.subspec 'NSString' do |string|
          string.source_files = 'YLDependencyCategories/YLDependencyCategories/Foundation/NSString/*.{h,m}'
          string.dependency 'JKCategories', '1.9.2'
      end
  end


  #UIKit
  s.subspec 'UIKit' do |uikit|
      uikit.public_header_files = 'YLDependencyCategories/YLDependencyCategories/UIKit/YLDependencyUIKit.h'
      uikit.source_files = 'YLDependencyCategories/YLDependencyCategories/UIKit/YLDependencyUIKit.h'
      uikit.frameworks = 'UIKit'

      #三级
      uikit.subspec 'UIColor' do |color|
          color.source_files = 'YLDependencyCategories/YLDependencyCategories/UIKit/UIColor/*.{h,m}'
          color.dependency 'JKCategories', '1.9.2'
      end
      uikit.subspec 'UIImage' do |image|
          image.source_files = 'YLDependencyCategories/YLDependencyCategories/UIKit/UIImage/*.{h,m}'
          image.dependency 'ZXingObjC', '3.2.2'
          image.dependency 'SDWebImage', '5.11.1'
      end
      uikit.subspec 'UIView' do |view|
          view.source_files = 'YLDependencyCategories/YLDependencyCategories/UIKit/UIView/*.{h,m}'
          view.dependency 'JKCategories', '1.9.2'
          view.dependency 'GKPhotoBrowser/SD', '2.2.1'
      end
  end



end
