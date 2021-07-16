#
# Be sure to run `pod lib lint YLDependencyCategories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLDependencyCategories'
  s.version          = '0.1.0'
  s.summary          = 'YLDependencyCategories component'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'dependency other'

  s.homepage         = 'https://github.com/jifengchao/YLDependencyCategories'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jifengchao' => '965524749@qq.com' }
  s.source           = { :git => 'https://github.com/jifengchao/YLDependencyCategories.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'YLDependencyCategories/Classes/**/*'
  

  s.subspec 'WHC_Debuger' do |wh|
    wh.source_files = 'YLDependencyCategories/Classes/WHC_Debuger/*'
  end
  s.subspec 'YLDependencyCategories' do |wh|
    wh.source_files = 'YLDependencyCategories/Classes/YLDependencyCategories/**/*'
  end

  s.dependency 'JKCategories', '1.9.2'
  s.dependency 'ZXingObjC', '3.2.2'
  s.dependency 'GKPhotoBrowser/SD', '2.2.1'
  s.dependency 'SDWebImage', '5.11.1'

end
