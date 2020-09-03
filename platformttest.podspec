
Pod::Spec.new do |s|
  s.name             = 'platformttest'
  s.version          = '0.0.2'
  s.summary          = 'A short description of platformttest.'

  s.homepage         = 'https://github.com/MExuanHe/UkeUtilsPlatformtest.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MExuanHe' => '17621407171@163.com' }
  s.source           = { :git => 'https://github.com/MExuanHe/UkeUtilsPlatformtest.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'platformttest/Classes/**/*'

   s.frameworks = 'UIKit'
   s.dependency 'Masonry', '~> 1.1.0'
   s.dependency 'YPNavigationBarTransition', '~> 2.0.9'
   s.dependency 'SDWebImage', '~> 5.6.0'
end
