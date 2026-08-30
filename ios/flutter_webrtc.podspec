#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_webrtc'
  s.version          = '1.6.0'
  s.summary          = 'Flutter WebRTC plugin for iOS.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/cloudwebrtc/flutter-webrtc'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'CloudWebRTC' => 'duanweiwei1982@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_webrtc/Sources/flutter_webrtc/**/*.{h,m,mm,cpp}'
  s.public_header_files = 'flutter_webrtc/Sources/flutter_webrtc/include/flutter_webrtc/**/*.h'
  s.dependency 'Flutter'
  # PINNED BACK from 144.7559.09 — the build this package moved to in 1.5.0 (#2078).
  # 1.4.0 shipped 144.7559.01: same libwebrtc milestone, earlier build. Reports of
  # iOS teardown regressions on .09 that .01 does not have: #2148 (MediaRecorder.stop
  # crashes on .09, works on .01) and #2153 (EXC_BAD_ACCESS on a background thread
  # when a track is disposed). Only the binary moves — no Dart or ObjC change.
  s.dependency 'WebRTC-SDK', '144.7559.01'
  s.ios.deployment_target = '13.0'
  s.static_framework = true
  s.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
    'USER_HEADER_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}/flutter_webrtc/Sources/flutter_webrtc/include/flutter_webrtc"'
  }
  s.libraries = 'c++'
end
