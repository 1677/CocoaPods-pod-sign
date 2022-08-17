#!/usr/bin/env ruby

module Pod
  class Installer

    alias_method :origin_run_podfile_post_install_hook, :run_podfile_post_install_hook
    def run_podfile_post_install_hook

      pod_sign_extract_bundle_id_and_team_id_from_user_project if $pod_sign_configurations_hash.empty?

      targets = if installation_options.generate_multiple_pod_projects
                  pod_target_subprojects.flat_map { |p| p.targets }
                else
                  pods_project.targets
                end
      targets.each do |target|
        target.build_configurations.each do |config|
          sign_config = $pod_sign_configurations_hash[config.name]
          next unless sign_config.instance_of?(Hash)

          config.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = sign_config[:bundle_id]
          config.build_settings['DEVELOPMENT_TEAM'] = sign_config[:team_id]
          config.build_settings['CODE_SIGN_STYLE'] = if sign_config[:sign_style]
                                                       sign_config[:sign_style]
                                                     else
                                                       config.type == :debug ? 'Automatic' : 'Manual'
                                                     end
          config.build_settings['CODE_SIGN_IDENTITY'] = if sign_config[:sign_identity]
                                                          sign_config[:sign_identity]
                                                        else
                                                          config.type == :debug ? 'Apple Development' : 'Apple Distribution'
                                                        end
        end
      end

      origin_run_podfile_post_install_hook
      true
    end

    private

    def pod_sign_extract_bundle_id_and_team_id_from_user_project
      target = aggregate_targets.first.user_project.root_object.targets.first
      target&.build_configurations&.each do |config|
          xcconfig_hash ||=
            if config.base_configuration_reference&.real_path&.exist?
              Xcodeproj::Config.new(config.base_configuration_reference.real_path).to_hash
            else
              {}
            end
          pod_sign_extract_bundle_id_and_team_id(xcconfig_hash, config.name)
          pod_sign_extract_bundle_id_and_team_id(config.build_settings, config.name)
        end
    end

    def pod_sign_extract_bundle_id_and_team_id(build_settings, config_name)
      bundle_id = build_settings['PRODUCT_BUNDLE_IDENTIFIER']
      team_id = build_settings['DEVELOPMENT_TEAM']
      sign_style = build_settings['CODE_SIGN_STYLE']
      sign_identity = build_settings['CODE_SIGN_IDENTITY']
      return unless bundle_id && team_id && config_name

      $pod_sign_configurations_hash[config_name] = { bundle_id: bundle_id,
                                                     team_id: team_id,
                                                     sign_style: sign_style,
                                                     sign_identity: sign_identity }
      
    end
  end
end
