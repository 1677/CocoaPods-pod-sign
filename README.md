# cocoapods-pod-sign

## ⚠️DEPRECATED
Since the Cocoapods 1.12.0 version has resolved this problem, this code repository is no longer updated

## English | [中文](https://www.jianshu.com/p/58d3202411c0)

cocoapods-pod-sign is a tool to help you set cocopads bundle identifier and team. In order to solve the compilation error of Xcode14.

## Installation

    $ gem install cocoapods-pod-sign

## Usage

### Recommended

I have received several user feedback encountering errors. I just added a new method to skip the signature. I recommend using the skip signature setting.

```
plugin 'cocoapods-pod-sign'
skip_pod_bundle_sign
```

## No recommended

There are two ways to use it, one is to automatically obtain the bundle identifier and team, and the other is to set it manually.

### Automatically

Just write the following code into the Podfile, it will automatically read the bundle identifier（version 1.3.x  no longer sets bundle identifier） and team from the main project.

    plugin 'cocoapods-pod-sign'

### Manually

You can also manually specify the bundle identifier and team under different configs. For example:

> Debug
bundle identifier: com.aaa.bbb
team: ABCDEFG

> Release
bundle identifier: com.ccc.ddd
team: HIJKLMN

> Profile
bundle identifier: com.xxx.eee
team: ASDFGHJ



```
plugin 'cocoapods-pod-sign'
config_pod_bundle_id_and_team_id({
  'Debug' => {:bundle_id => 'com.aaa.bbb', :team_id => 'ABCDEFG'},
  'Release' => {:bundle_id => 'com.ccc.ddd', :team_id => 'HIJKLMN'},
  'Profile' => {:bundle_id => 'com.xxx.eee', :team_id => 'ASDFGHJ'}
})
```

