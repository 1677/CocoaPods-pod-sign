# cocoapods-pod-sign

cocoapods-pod-sign is a tool to help you set cocopads bundle identifier and team. In order to solve the compilation error of Xcode14.

## Installation

    $ gem install cocoapods-pod-sign

## Usage

There are two ways to use it, one is to automatically obtain the bundle identifier and team, and the other is to set it manually.

### Automatically

Just write the following code into the Podfile, it will automatically read the bundle identifier and team from the main project.

    plugin 'cocoapods-pod-sign'

### Manually

You can also manually specify the bundle identifier and team under different configs. For example, I want to set the bundle identifier of the Debug config to com.xxx.app and the team to xxooxxoo.

```
plugin 'cocoapods-pod-sign'
config_pod_bundle_id_and_team_id({'Debug' => {:bundle_id => 'com.xxx.app', :team_id => 'xxooxxoo'}})
```

