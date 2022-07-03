#!/usr/bin/env ruby

$pod_sign_configurations_hash = {}
module Pod
  class Podfile
    module DSL

      def config_pod_bundle_id_and_team_id(configurations)
        unless configurations.instance_of?(Hash)
          UI.info "config_pod_bundle_id_and_team_id parameters not hash".red
          return
        end
        configurations.each do |name, configuration|
          unless configuration.instance_of?(Hash)
            UI.info "config_pod_bundle_id_and_team_id parameters not hash".red
            return
          end
          unless configuration[:bundle_id] and configuration[:team_id]
            UI.info "config_pod_bundle_id_and_team_id parameters parameters error".red
            return
          end
        end
        UI.info "config_pod_bundle_id_and_team_id parameters setup success"
        $pod_sign_configurations_hash = configurations
      end
    end
  end
end
