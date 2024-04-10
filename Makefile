

run:
	flutter run
run-prod:
	flutter run --release

clean:
	flutter clean
	flutter pub get
	make build-runner
	make format

format:
	dart format . --line-length 120

lint:
	dart analyze

test:
	flutter test
.PHONY:test

build-runner:
	dart run build_runner build --delete-conflicting-outputs

build-runner-watch:
	dart run build_runner watch --delete-conflicting-outputs

appicon:
	dart run flutter_launcher_icons -f flutter_launcher_icons.yaml

# ANDROID BUILD
build-apk:
	@echo "Building Android .apk ..."
	make clean
	flutter build apk --target-platform=android-arm,android-arm64 --obfuscate --split-debug-info=./dist/debug/
	cp build/app/outputs/bundle/release/app-release.apk dist/
	mv dist/app-release.apk dist/zaunteam.apk