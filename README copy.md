# flutter-init-project
Configure ios:
Add to Podfile: 
```
target 'Runner' do
  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
  use_modular_headers!
  target 'RunnerTests' do
    inherit! :search_paths
  end
end
```

Configure android:
Add to app/build.gradle
```
        minSdkVersion 19
        multiDexEnabled true
```
