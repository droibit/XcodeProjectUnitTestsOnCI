TEST_SCHEME := UnitTestsOnCI
TEST_PROJECT := UnitTestsOnCI.xcodeproj
TEST_SDK := iphonesimulator
TEST_DESTINATION := 'platform=iOS Simulator,OS=latest,name=iPhone 16'

.PHONY: test
test:
	set -o pipefail && \
	xcodebuild test -project $(TEST_PROJECT) \
	-scheme $(TEST_SCHEME) \
	-sdk $(TEST_SDK) \
	-destination $(TEST_DESTINATION) \
	CODE_SIGNING_ALLOWED='NO' \
	| xcbeautify

.PHONY: bootstrap
bootstrap:
	@mint bootstrap	

.PHONY: lint
lint:
	@xcrun --sdk macosx mint run swiftlint swiftlint lint