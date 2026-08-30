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
  # 144.7559.10, not the .09 this release pinned. .09 crashes on iOS with
  # EXC_BAD_ACCESS writing to NULL+0x28 — webrtc::FineAudioBuffer::ResetPlayout() called
  # on a null AudioEngineDevice::fine_audio_buffer_, because the step that CREATES the
  # buffer and the step that USES it are guarded differently. Fixed upstream by
  # webrtc-sdk/webrtc f47af7bc9658 (2026-06-15), "Fix AudioEngineDevice crash from null
  # FineAudioBuffer on playout/record start (#256)", which adds EnsureFineAudioBuffer()
  # at four sites — shipped in .10, six days after .09.
  #
  # A drop-in: .09 and .10 public headers are byte-identical (the fix is in
  # audio_engine_device.mm), so nothing else moves. Only the binary changes.
  s.dependency 'WebRTC-SDK', '144.7559.10'
  s.ios.deployment_target = '13.0'
  s.static_framework = true
  s.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
    'USER_HEADER_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}/flutter_webrtc/Sources/flutter_webrtc/include/flutter_webrtc"'
  }
  s.libraries = 'c++'
end
