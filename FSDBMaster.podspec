Pod::Spec.new do |s|
  s.name             = 'FSDBMaster'
  s.version          = '0.0.4'
  s.summary          = 'FSDBMaster is a tool for sqlite3'
  s.description      = <<-DESC
		This is a very small software library, offering a few methods to help with programming.
    DESC

  s.homepage         = 'https://github.com/fuchina/FSDBMaster'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fudon' => '1245102331@qq.com' }
  s.source           = { :git => 'https://github.com/fuchina/FSDBMaster.git', :tag => s.version.to_s }

  s.source_files = 'FSDBMaster/Classes/*.{h,m,swift}'

  s.swift_version = '5.9'
  
  s.frameworks = 'UIKit'
  s.ios.deployment_target = '12.0'

end
