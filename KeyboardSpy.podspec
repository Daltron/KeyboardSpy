
Pod::Spec.new do |s|
  s.name             = 'KeyboardSpy'
  s.version          = '1.1'
  s.summary          = 'The Easiest Way to Observe Keyboard Notifications in iOS'
  s.description      = 'KeyboardSpy is a super lightweight and easy to use wrapper that makes observing keyboard notifications in iOS a breeze.'
  s.homepage         = 'https://github.com/Daltron/KeyboardSpy'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daltron' => 'daltonhint4@gmail.com' }
  s.source           = { :git => 'https://github.com/Daltron/KeyboardSpy.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'KeyboardSpy/Classes/**/*'
end
