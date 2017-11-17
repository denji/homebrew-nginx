# Contributing

Thank you for your interest in contributing to [Homebrew NGINX]. The following guidelines are designed to help you write more efficient pull requests.

## Formula Guidelines

**IMPORTANT** First read Homebrew's [Formula Cookbook] and [Acceptable Formulae]. If your formula installs or depends on Python modules read [Python for Formula Authors] as well.

Homebrew follows the [GitHub Ruby Styleguide]. Check `brew style` or `brew audit --strict` before submitting a new formula.

#### Patches

Homebrew provides DSL for applying diff patches appended to the end of formula file, or as remote files (e.g. a [Gist]). In most cases, patches should be submitted upstream and linked to in your comments.

#### Tests

All formulæ should be accompanied by tests. We greatly appreciate any submissions that improve individual tests and test coverage in Homebrew NGINX.

The `test do` block allows for a post-build test of software functionality sandboxed within a temporary `testpath`. For example, a test program may be written and compiled, and its output checked against an expected value. Meaningful tests are preferred over simple commands like `system "foo", "-v"`.

`make check` or equivalent should be enabled if the package provides it:

    option "without-test", "Skip build-time tests (not recommended)""
    ...
    system "make"
    system "make", "check" if build.with? "test"
    system "make", "install"

If this target takes an inordinate amount of resources or is otherwise problematic the option can be switched to `"with-test"`, disabling `make check` in the default build.

#### Revisions

Adding or incrementing a [formula revision] forces a formula upgrade, for instance when breakage from an upgraded dependency necessitates rebuilding the downstream package. When upgrading a formula to a new version, however, any existing revision needs to be reset (i.e. removed).

#### Bottles

[Bottles] are Homebrew's pre-compiled binary packages. Please avoid making any changes to the bottle block. Bottle checksums, URLs, and revisions are handled automatically by [Brew Test Bot].

## Submitting a Pull Request

First read core Homebrew's [How To Open a Homebrew Pull Request (and get it merged)]. The Homebrew NGINX tap repository is located in `$(brew --repository)/Library/Taps/denji/homebrew-nginx`.

Check [open pull requests] before submitting a duplicate. We prefer one formula per PR.

Preface your commit message with the formula name, followed by a brief summary:
* `foo: add test`
* `bar: make X11 optional`
Version upgrades should just be titled with their version:
* `baz 2.4.1`
* `qux 0.1.2 (new formula)`

Use the rest of the commit message to describe your changes and link to any relevant issues. When your submission is ready to merge, squash all your commits to a single commit and push to your remote branch, with `--force` if necessary.

## Pull Request vs. Tap

Anyone can host their own tap (see [Interesting Taps & Forks]). Homebrew NGINX may give your formula wider visibility, but a tap is preferable when:
* Your formula must be brewable urgently.
* It is part of a group of specialized and/or related formulæ.
* It is HEAD-only or lacks a stable tagged release.

Feel free to start your own tap and submit to Homebrew NGINX later.

## Useful Snippets and Notes

#### Linking Dependencies

Avoid refering to `HOMEBREW_PREFIX` in a formula. If you need to refer to dependency libraries or header files, use stable `opt` paths: `Formula["foo"].opt_prefix`, `Formula["foo"].opt_lib`,  `Formula["foo"].opt_include`, etc.

#### OpenMP

The current version of clang, Homebrew's default C/C++ compiler, does not support OpenMP, but GCC does.

If OpenMP support is obligatory, `needs :openmp` may be used to avoid building with clang/LLVM altogether. If it is optional, one may use
```
options "with-openmp", "Build with OpenMP support"
needs :openmp if build.with? "openmp"
```

#### MPI

Depending on `:mpi` is more flexible than depending directly on `mpich2` or `open-mpi`. Remember that users could have installed either and the two `conflict_with` each other.

#### Checking What Options Were Used to Build a Dependency

    nprocs = Tab.for_formula("foo").without?("mpi") ? 1 : Hardware::CPU.cores

## Suggestions

Improvements to this guide are appreciated via issues or pull requests. If you're willing to add a new section to this documentation or the wiki, we would very much welcome your contribution.

[Homebrew NGINX]: https://github.com/denji/homebrew-nginx
[open pull requests]: https://github.com/denji/homebrew-nginx/pulls
[How To Open a Homebrew Pull Request (and get it merged)]: https://github.com/Homebrew/brew/blob/master/docs/How-To-Open-a-Homebrew-Pull-Request-(and-get-it-merged).md
[Interesting Taps & Forks]: https://github.com/Homebrew/brew/blob/master/docs/Interesting-Taps-%26-Forks.md
[Formula revision]: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md#formulae-revisions
[Bottles]: https://github.com/Homebrew/brew/blob/master/docs/Bottles.md
[Brew Test Bot]: https://github.com/Homebrew/brew/blob/master/docs/Brew-Test-Bot.md#brew-test-bot
[GitHub Ruby Styleguide]: https://github.com/styleguide/ruby
[Formula Cookbook]: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
[Acceptable Formulae]: https://github.com/Homebrew/brew/blob/master/docs/Acceptable-Formulae.md
[Python for Formula Authors]: https://github.com/Homebrew/brew/blob/master/docs/Python-for-Formula-Authors.md
[Gist]: https://gist.github.com/
