
Pod::Spec.new do |s|

  s.name         = "NumberCalculate"
  s.version      = "0.0.2"
  s.summary      = "数值加减小控件"
  s.homepage     = "https://github.com/XueYangLee/NumberCalculate"
  s.license      = "MIT"
  s.author       = { "Singularity_Lee" => "496736912@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/XueYangLee/NumberCalculate.git", :tag => s.version}
  s.source_files = "NumberCalculate/NumberCalculate/*.{h,m}"
  s.resources    = "NumberCalculate/NumberCalculate/resource/*.png"
  s.requires_arc = true


end
