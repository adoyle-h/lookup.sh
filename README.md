# lookup.sh

Look up project directory based on a locator file.
Never write `../../` relative path format.

## TOC

<!-- MarkdownTOC GFM -->

- [Install](#install)
- [Usage](#usage)
- [Versioning](#versioning)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->

## Install

## Usage

For example, suppose that there are below files structure:

```
/example
│
├── .project_locator
├── A
│   ├── file-1
│   ├── file-2
│   ├── file-3
│   └── C
│       └── script-c.sh
└── B
    └── script-b.sh
```


You created a empty file named `.project_locator` in project root directory.

And then you could get the `ROOT_DIR` path via `lookup_dir`.

```
# in /example/B/script-b.sh

source lookup.sh
ROOT_DIR=$(lookup_dir)
echo $ROOT_DIR    # => /example
```

```
# in /example/C/script-c.sh

source lookup.sh
ROOT_DIR=$(lookup_dir)
echo $ROOT_DIR    # => /example
```

If you put another `.project_locator` in `/example/A/.project_locator`

```
/example
│
├── .project_locator
├── A
│   ├── .project_locator
│   ├── file-1
│   ├── file-2
│   ├── file-3
│   └── C
│       └── script-c.sh
└── B
    └── script-b.sh
```

```
# in /example/C/script-c.sh

source lookup.sh
ROOT_DIR=$(lookup_dir)
echo $ROOT_DIR    # => /example/A
```

## Versioning

The versioning follows the rules of SemVer 2.0.0.

**Attentions**: anything may have **BREAKING CHANGES** at **ANY TIME** when major version is zero (0.y.z), which is for initial development and the public API should be considered unstable.

For more information on SemVer, please visit http://semver.org/.


## Copyright and License

Copyright (c) 2017 ADoyle. The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- Links -->

[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
