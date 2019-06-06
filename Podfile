# Uncomment the next line to define a global platform for your project
platform :ios, '11.2'

target 'capios' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for capios
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
  pod 'R.swift', '~> 5.0'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'Valet'
  pod 'SwiftLint'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.0'
      # enable tracing resources
      if target.name == 'RxSwift'
        if config.name == 'Debug'
          config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D',
                                                          'TRACE_RESOURCES']
        end
      end
    end
  end
end
