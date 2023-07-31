# bazel-xc-framework
**Building static xcframework with bazel**

In this sample, I was trying to build static xcframework for distribution, by using rules_apple's [apple_static_xcframework](https://github.com/tymurmustafaiev/bazel-xc-framework.git)

**Project structure:**

![sample.jpg](Readme%2Fsample.jpg)

By making this setup, I could generate static xcframework and use it in sample app

**Important notes**:

`private_deps` in `swift_library` should be marked as `@_implementationOnly import` in your code,
otherwise you'll have an error in 
your sample app, that one of the dependencies are not found

**Other notes:**
No need to mark imports of your transitive deps as `@_implementationOnly import` as you can see on image
from Interactor block.

To build xcframework, run this command from project root folder:
`bazelisk build PerformerFramework`
