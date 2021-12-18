Pod::Spec.new do |spec|
  spec.name         = "MZCircleProgress"
  spec.version      = "0.0.1"
  spec.summary      = "圆形进度条、弧形进度条"
  spec.homepage     = "https://github.com/1691665955/MZCircleProgress"
  spec.authors         = { 'MZ' => '1691665955@qq.com' }
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.source = { :git => "https://github.com/1691665955/MZCircleProgress.git", :tag => spec.version}
  spec.platform     = :ios, "9.0"
  spec.swift_version = '5.0'
  spec.source_files  = "MZCircleProgress/MZCircleProgress/*"
end
