Pod::Spec.new do |s|
    s.name         = "SHLabelPageView"
    s.version      = "2.0.5"
    s.summary      = "各种标签页，新闻标签页"
    s.license      = "MIT"
    s.authors      = { "CSH" => "624089195@qq.com" }
    s.platform     = :ios, "6.0"
    s.requires_arc = true
    s.homepage     = "https://github.com/CCSH/SHLabelPageView"
    s.source       = { :git => "https://github.com/CCSH/SHLabelPageView.git", :tag => s.version }
    s.source_files = "SHLabelPageView/*.{h,m}"
    s.dependency    "UIView+SHExtension","0.0.1"
end
