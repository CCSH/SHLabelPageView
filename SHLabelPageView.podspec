#
#  Be sure to run `pod spec lint SHLabelPageView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

    s.name         = "SHLabelPageView"
    s.version      = "0.0.1"
    s.summary      = "A short description of SHLabelPageView."
    s.license      = 'MIT'
    s.authors      = {'CSH' => '624089195@qq.com'}
    s.platform     = :ios, '6.0'
    s.homepage     = 'https://github.com/CCSH/SHLabelPageView'
    s.source       = {:git => 'https://github.com/CCSH/SHLabelPageView.git', :tag => s.version}
    s.source_files = '*'
    s.requires_arc = true

end
