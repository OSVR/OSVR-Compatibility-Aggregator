require 'osvr_compatibility_aggregator/source_collection'

module OsvrCompatibilityAggregator
  def self.device_descriptors
    SourceCollection.new do |s|
      s.collection autodetected: true do |s|
        s.github_file repo: 'OSVR/OSVR-Core',
                      file: 'plugins/multiserver/com_osvr_Multiserver_OSVRHackerDevKit.json'

        s.github_file repo: 'OSVR/OSVR-Core',
                      file: 'plugins/multiserver/com_osvr_Multiserver_RazerHydra.json'

      end
      s.github_file repo: 'OSVR/OSVR-Core',
                    file: 'plugins/multiserver/com_osvr_Multiserver_YEI_3Space_Sensor.json',
                    sample_config: 'apps/sample-configs/osvr_server_config.HDKv1_YEI.xrightydown.sample.json'

      s.github_file repo: 'OSVR/OSVR-Core',
                    file: 'plugins/opencv/com_osvr_VideoCapture_OpenCV.json',
                    sample_config: 'apps/sample-configs/osvr_server_config.OpenCVCamera.sample.json',
                    note: 'Provides access to a wide variety of video cameras/webcams on multiple platforms.'

      # DIRECTORY with all the external-device (VRPN) device descriptors
      s.github_dir repo: 'OSVR/OSVR-Core',
                   dir: 'apps/external-devices/device-descriptors',
                   note: 'External device supported using VRPN and descriptor/configuration files bundled with OSVR-Core'

      s.github_file repo: 'OSVR/OSVR-Leap-Motion',
                    file: 'com_osvr_LeapMotion.json'

      s.github_file repo: 'OSVR/OSVR-FSM9',
                    file: 'com_osvr_Freespace.json'

      s.github_file repo: 'OSVR/OSVR-Nod',
                    file: 'Plugin/NodOSVR.json',
                    autodetected: true

      s.github_file repo: 'OSVR/OSVR-Vive',
                    file: 'com_osvr_Vive.json',
                    sample_config: 'osvr_server_config.vive.sample.json',
                    autodetected: true,
                    note: 'Configuration file specifies display descriptor.',
                    download: '[Pre-built Windows binaries](http://access.osvr.com/binary/vive)'

      s.github_file repo: 'OSVR/OSVR-SMI',
                    file: 'com_osvr_SMI_EyeTracker.json',
                    sample_config: 'osvr_server_config.SMIeyeTracker.sample.json',
                    download: '[Pre-built 32-bit Windows binaries](http://access.osvr.com/binary/smi)'

      s.github_file repo: 'OSVR/OSVR-FOVE',
                    file: 'com_osvr_fove_eyetracker.json',
                    sample_config: 'osvr_server_config.fove.json',
                    download: '[Pre-built 64-bit Windows binaries](http://access.osvr.com/binary/fove)'

      s.github_file repo: 'OSVR/OSVR-FOVE',
                    file: 'com_osvr_fove_tracker.json',
                    sample_config: 'osvr_server_config.fove.json',
                    download: '[Pre-built 64-bit Windows binaries](http://access.osvr.com/binary/fove)'

      s.github_file repo: 'OSVR/OSVR-Oculus-Rift',
                    file: 'com_osvr_OculusRift.json',
                    sample_config: 'osvr_server_config.oculusrift.sample.json',
                    download: '[Pre-built Windows binaries](http://access.osvr.com/binary/oculus)'

      s.github_file repo: 'OSVR/OSVR-LaputaVR',
                    file: 'com_osvr_Laputa.json',
                    sample_config: 'osvr_server_config.laputa.sample.json',
                    download: '[Pre-built Windows binaries](http://access.osvr.com/binary/laputavr)'
    end
  end
end
