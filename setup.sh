#!/bin/bash

printf "Getting FLEX files\n"
FD=tmpFLEXgit
git clone https://github.com/Flipboard/FLEX.git "$FD"
printf "Done. Copying files\n"
mkdir Sources
find "$FD"/Classes -type f \( -name "*.h" -o -name "*.m" -o -name "*.mm" \) -exec mv {} Sources/ \;
# Fix "ARC forbids synthesizing a property of an Objective-C object with unspecified ownership
# or storage attribute" (https://github.com/textmate/textmate/pull/1402)
sed -i 's/(nonatomic) void/(nonatomic, strong) void/g' Sources/*.{m,mm}
rm -rf "$FD"
