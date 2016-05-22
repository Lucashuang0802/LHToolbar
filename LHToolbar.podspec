#
# Be sure to run `pod lib lint LHToolbar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LHToolbar"
  s.version          = "1.0.0-beta"
  s.summary          = "An alternative way to create a tool bar for iOS applications."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "LHToolbar is an alternative way to create a toolbar in iOS applications. Tool bars are widely used in iOS applications, however, UIToolbar class lacks of updates and flexibility, uncustomizable to some extent. It motivated me to create a container like toolbar so developers have more control and flexibility on layout and UIs. LHToolbar concentrates in providing fully functioning toolbar container, manipulation of container items and many more in the future."

  s.homepage         = "https://github.com/Lucashuang0802/LHToolbar"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Lucas Huang" => "xhuang0802@gmail.com" }
  s.source           = { :git => "https://github.com/Lucashuang0802/LHToolbar.git", :tag => s.version.to_s }
  s.social_media_url = 'http://www.focushuang.com/'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LHToolbar/Toolbar/**/*'
  
  # s.resource_bundles = {
  #   'LHToolbar' => ['LHToolbar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
