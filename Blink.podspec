#
# Be sure to run `pod lib lint Blink.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Blink'
  s.version          = '0.0.2'
  s.summary          = 'Blink is a test for swift personal app'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                 Atest with Blink wanna to search my pod
               DESC

  s.homepage         = 'https://github.com/happyDreamTaken'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fengxueshi6666@icloud.com' => '335629146@qq.com' }
  s.source           = { :git => 'https://github.com/fengxueshi6666@icloud.com/Blink.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Blink/Classes/**/*'
  s.swift_version = '4.0' 
  # s.resource_bundles = {
  #   'Blink' => ['Blink/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
