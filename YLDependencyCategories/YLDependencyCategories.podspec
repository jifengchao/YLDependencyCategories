#
# Be sure to run `pod lib lint YLDependencyCategories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLDependencyCategories'
  s.version          = '0.1.1'
  s.summary          = 'YLDependencyCategories component'

  s.homepage         = 'https://github.com/jifengchao/YLDependencyCategories'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jifengchao' => '965524749@qq.com' }

  s.ios.deployment_target = '9.0'

  s.source           = { :git => 'https://github.com/jifengchao/YLDependencyCategories.git', :tag => s.version.to_s }
  s.source_files = "YLDependencyCategories/Classes/WHC_Debuger/*.{h,m}"
  
  # s.requires_arc     = true
    
  s.dependency 'JKCategories', '1.9.2'
  s.dependency 'ZXingObjC', '3.2.2'
  s.dependency 'GKPhotoBrowser/SD', '2.2.1'
  s.dependency 'SDWebImage', '5.11.1'

end
