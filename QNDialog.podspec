#
# Be sure to run `pod lib lint QNDialog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.swift_versions = ['5.0']
  s.name             = 'QNDialog'
  s.version          = '0.1.0'
  s.summary          = 'A short description of QNDialog.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/quannguyen90/QNDialog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'quannguyen90' => 'quannv.tm@gmail.com' }
  s.source           = { :git => 'https://github.com/quannguyen90/QNDialog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'QNDialog/Classes/**/*'
  
  # s.resource_bundles = {
  #   'QNDialog' => ['QNDialog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.static_framework = false
  s.dependency 'SwiftMessages', '~> 9.0.5'
  s.dependency 'QNQuantityTextField'
  s.resource_bundles = {
    'QNDialog' => ['QNDialog/Assets/*.xcassets']
  }
end
