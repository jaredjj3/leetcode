This repository contains I solved on [leetcode](https://leetcode.com/).

To install the dependencies, run:

```
bundle install
```

To run the file watcher, run

```
bundle exec guard
```

To automatically add a file to lib, run

```
bundle exec guard
```

and add an array element to the methods key of  `index.yaml`.
Guard will call `rake sync_index`, which syncs the files in lib with the list provided in that file.
*THIS WILL DELETE FILES IN /lib THAT ARE NOT PRESENT IN THE `index.yaml` FILE, PLEASE USE WITH CAUTION.*

To run a test, run

```
bundle exec guard
```

and save the file. This should trigger a file system event, which will run the test on the file that
you saved. Any other changes to the file will trigger the test to be run.