# Tools-configuration

![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-playbook-test.svg?logo=github)

Personal configuration of different IT tools. This repo is useless but this is my first one

## Contributing

Please read [CONTRIBUTING.md](https://github.com/Pandemonium1986/.github/blob/main/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Pre Committing

This repository use [pre-commit](https://pre-commit.com) to manage commit-msg, pre-commit and pre-push hooks (if necessary).
Be sure to install them before any push.

```sh
cd MY_REPO && \
pre-commit install --hook-type commit-msg && \
pre-commit install --hook-type pre-push && \
pre-commit install
```

For more info see this [cheatsheet](https://github.com/Pandemonium1986/cheatsheet/blob/main/Commit.md)

Also every commit MUST follow the [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

- **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

See also the list of [contributors](https://github.com/Pandemonium1986/ansible-playbook-test/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
