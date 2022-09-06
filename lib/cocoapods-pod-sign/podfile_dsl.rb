#!/usr/bin/env ruby

require 'cocoapods-pod-sign/pod_sign_storage'

module Pod
  class Podfile
    module DSL

      def config_pod_bundle_id_and_team_id(configurations)
        unless configurations.instance_of?(Hash)
          UI.info 'config_pod_bundle_id_and_team_id parameters not hash'.red
          return
        end
        configurations.each do |name, configuration|
          unless configuration.instance_of?(Hash)
            UI.info 'config_pod_bundle_id_and_team_id parameters not hash'.red
            return
          end
          unless configuration[:bundle_id] && configuration[:team_id]
            UI.info 'config_pod_bundle_id_and_team_id parameters parameters error'.red
            return
          end
        end
        UI.info 'config_pod_bundle_id_and_team_id parameters setup success'
        storage = PodSignStorage.instance
        storage.configurations = configurations
      end

      def skip_pod_bundle_sign
        storage = PodSignStorage.instance
        storage.skip_sign = true
      end
    end
  end
end
