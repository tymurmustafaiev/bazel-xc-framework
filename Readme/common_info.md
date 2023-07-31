**Other notes**

Here I'll put together everything I've discovered until I managed to make working build.

Before making final working static library, I've tried different combinations of rules:

````
# BUILD file
# Dependency
apple_framework(
    name = "TopLevelFramework",
    ...
)

# Static frameworks
apple_static_xcframework(
    name = StaticXCFramework,
    deps = [:TopLevelFramework]
    ...
)

ios_static_framework(
    name = StaticiOSFramework,
    deps = [:TopLevelFramework]
    ...
)

# Apple framework Packaging
apple_framework_packaging(
    name = FrameworkPackage,
    deps = [:TopLevelFramework]
    ...
)

# Console
bazel build FrameworkPackage
bazel build StaticiOSFramework
bazel build StaticXCFramework
````
Which builds, but fails with error in sample app when you try to use it:

`Underlying Objective-C module ‘TopLevelFramework’ not found in swiftinterface file`
Then, I tried to use `swift_library` with `apple_static_xcframework`.

By building this combination:

```
# BUILD file
swift_library(
    name = "Dependency1",
    ...
)

apple_static_xcframework(
    name = "StaticSDK",
    deps = [
        ":Dependency1",
    ]
    ...
)

# Console
bazel build StaticSDK
```
I've got working static xcframework. But I needed more than one dependency. 

And by adding more than 1 transitive dependency, it started failing with error:

`Swift third party frameworks expect a single swift_library dependency with no transitive swift_library dependencies.`
```
# BUILD file
swift_library(
    name = "Dependency1",
    deps = [
        ":Dependency2",
        ":Dependency3",
    ]
)

swift_library(
    name = "Dependency2",
    ...
)

swift_library(
    name = "Dependency3",
    ...
)

apple_static_xcframework(
    name = "StaticSDK",
    deps = [
        ":Dependency1",
    ]
    ...
)

# Console
bazel build StaticSDK
```
Then, I've read that If I use `avoid_deps` property in `apple_static_xcframework`, it should compile:

```
apple_static_xcframework(
    name = "StaticSDK",
    deps = [
        ":Dependency1",
    ],
    avoid_deps = [
        ":Dependency2",
        ":Dependency3",
    ]
    ...
)
```
And yes, it compiles, but doesn't work in sample app because of this error:
`No such module ‘Dependnecy2’ in swiftinterface file`.

I also tried to build `apple_framework` with multiple dependencies, and to make `xcframework` from it:

```
# BUILD file
apple_framework(
    name = "AppleFramework",
    deps = [
        ":Dependency1",
        ":Dependency2",
        ":Dependency3",
    ]
    ...
)

# Console
bazel build AppleFramework
```
It builds, you can import it into project, but no there will be no dependencies. 
And, I couldn't make `xcframework` from `apple_framework` rule. Even with xcode command:
`xcodebuild -create-xcframework`. As an output, I got error: `no swiftinterface file found`.
Even bazel features like `swift.emit_swiftinterface` doesn't help.

And finally, my colleague send me link with with `private_deps` in `swift_library` and I tried it, by
putting dependencies of top level framework to `private_deps`:
```
# BUILD file
swift_library(
    name = "Dependency1",
    private_deps = [
        ":Dependency2",
        ":Dependency3",
    ]
)

swift_library(
    name = "Dependency2",
    ...
)

swift_library(
    name = "Dependency3",
    ...
)

apple_static_xcframework(
    name = "StaticSDK",
    deps = [
        ":Dependency1",
    ]
    ...
)

# Console
bazel build StaticSDK
```
And it worked! Important note, that I had to use 
`@_implementationOnly import Dependency2` and `@_implementationOnly import Dependency3`
in `Dependency1` codebase to satisfy compiler.

Same trick works with combining swift_library and apple_framework with **mixed codebase** of Swift and Objc.
```
# BUILD file
swift_library(
    name = "Dependency1",
    private_deps = [
        ":Dependency2",
        ":Dependency3",
    ]
)

apple_framework(
    name = "Dependency2",
    srcs = glob(["*.h, *.m, *.swift])
    ...
)

apple_framework(
    name = "Dependency3",
    ...
)

apple_static_xcframework(
    name = "StaticSDK",
    deps = [
        ":Dependency1",
    ]
    ...
)

# Console
bazel build StaticSDK
```