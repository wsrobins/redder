platform :ios, '11'
use_frameworks!
inhibit_all_warnings!

target 'Redder' do
	pod 'RxCocoa', '4.0.0-beta.0'
	pod 'RxGesture', :git => 'git@github.com:sidmani/RxGesture.git', :branch => 'swift-4'
	pod 'SnapKit'
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		if target.name == 'RxSwift'
			target.build_configurations.each do |config|
				if config.name == 'Debug'
					config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
				end
			end
		end
	end
end
