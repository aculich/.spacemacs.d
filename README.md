http://apple.stackexchange.com/questions/69223/how-to-replace-mac-os-x-utilities-with-gnu-core-utilities/88812#88812
The --default-names option is optional, turn on this if you really need to use these GNU commands as default ones, or they will be compiled with a g prefix.

Reference: http://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/

```
brew tap homebrew/dupes
brew install coreutils  --with-default-names
brew install findutils --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install grep --with-default-names
brew install gnutls
brew install gawk
brew install ag
```
