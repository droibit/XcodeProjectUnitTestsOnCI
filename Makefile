TEST_SCHEME := UnitTestsOnCI
TEST_PROJECT := UnitTestsOnCI.xcodeproj
TEST_SDK := iphonesimulator
TESET_DESTINATION := 'platform=iOS Simulator,OS=latest,name=iPhone 15'

.PHONY: test
test:
	set -o pipefail && \
	xcodebuild test -project $(TEST_PROJECT) \
	-scheme $(TEST_SCHEME) \
	-sdk $(TEST_SDK) \
	-destination $(TESET_DESTINATION)
