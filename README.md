docker run --rm -it -v ${PWD}:/stage flutter-docker-image /bin/bash -c "flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs && cd dashbook &&  flutter pub get && cd && flutter analyze --no-fatal-warnings"


docker run --rm -it -v ${PWD}:/stage flutter-docker-image /bin/bash -c "flutter pub get && cd dashbook && flutter pub get && cd /stage && flutter packages pub run build_runner build --delete-conflicting-outputs  && flutter pub run build_runner build --delete-conflicting-outputs && flutter analyze --no-fatal-warnings"





docker run --rm -it -v ${PWD}:/stage flutter-docker-image /bin/bash -c "flutter pub get && cd dashbook && flutter pub get && cd && flutter packages pub run build_runner build --delete-conflicting-outputs & flutter pub run build_runner build --delete-conflicting-outputs && flutter analyze --no-fatal-warnings"


<<<<<<< Updated upstream
- [`3.7.1-androidsdk33-r0`, `3.7.1`, `3.7`, `3`, `latest`][201]
=======
>>>>>>> Stashed changes


docker run --rm -it -v ${PWD}:/stage flutter-docker-image /bin/bash -c "flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs && cd dashbook &&  flutter pub get && cd && flutter analyze -vv --no-fatal-warnings"






flutter test --verbose



        ##flutter analyze --no-congratulate -vv --no-fatal-infos --no-fatal-warnings

<<<<<<< Updated upstream
![Flutter Logo](https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png)




## How to use this image

Mount your project directory and run the necessary `flutter` command:
```bash
docker run --rm -v /my/rust/project:/app -w /app instrumentisto/flutter \
    flutter doctor
```




## Image tags


### `<X>`

Latest tag of the latest major `X` [Flutter] version.


### `<X.Y>`

Latest tag of the latest minor `X.Y` [Flutter] version.


### `<X.Y.Z>`

Latest tag of the concrete `X.Y.Z` [Flutter] version.


### `<X.Y.Z>-androidsdk<A>-r<N>`

Concrete `N` image revision tag of the concrete `X.Y.Z` [Flutter] version with the concrete `A` API level version of [Android SDK].

Once built, it's never updated.




## License

[Flutter] is licensed under [BSD 3-Clause "New" or "Revised" license][92].

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

The [sources][90] for producing `instrumentisto/flutter` Docker images are licensed under [Blue Oak Model License 1.0.0][91].




## Issues

We can't notice comments in the [DockerHub] (or other container registries) so don't use them for reporting issue or asking question.

If you have any problems with or questions about this image, please contact us through a [GitHub issue][80].




[Android SDK]: https://developer.android.com/studio
[DockerHub]: https://hub.docker.com
[Flutter]: https://flutter.dev

[2]: https://hub.docker.com/r/cirrusci/android-sdk

[80]: https://github.com/instrumentisto/flutter-docker-image/issues
[90]: https://github.com/instrumentisto/flutter-docker-image
[91]: https://github.com/instrumentisto/flutter-docker-image/blob/main/LICENSE.md
[92]: https://github.com/flutter/flutter/blob/master/LICENSE

[201]: https://github.com/instrumentisto/flutter-docker-image/blob/main/Dockerfile
=======
      - name: Lint
        run: |
          flutter test --verbose
>>>>>>> Stashed changes
