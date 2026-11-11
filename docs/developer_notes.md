# Developer Notes

## Project Setup

### Set Up Tools

#### UV info

This project uses [uv](https://docs.astral.sh/uv/) as the package manager. If uv is not installed, follow [this guide](https://docs.astral.sh/uv/getting-started/installation/) to install it. Then, synchronize the project dependencies with:

```sh
uv sync
```

For more information on uv, including adding dependencies or running tools, refer to [this documentation](https://docs.astral.sh/uv/guides/).

##### UV Helpful Knowledge

To install a package with uv use:

```sh
uv add [package_name]
```

#### Set Up Git Hooks

This project uses [Lefthook](https://lefthook.dev/) to manage Git hooks, especially for the pre-commit hook. Lefthook will be installed as a development dependency by the package manager, and the pre-commit hook can be installed with:

```sh
uv run lefthook install
```

After that, each commit to the project will trigger a hook that checks for formatting and linting. This ensures that committed files follow the specified rules.

For more information on Lefthook and how it manages hooks, refer to [this documentation](https://lefthook.dev/usage/index.html).

### Developing the Project

#### Testing the Package

Test files in this project are named `test_*.py` and located in the [`tests`](./tests) directory. Write the necessary tests for your package and run them with:

```sh
uv run pytest -v --cov
```

This project uses [Pytest](https://docs.pytest.org/en/stable/) as the testing framework. For more information on testing with Pytest, refer to [this documentation](https://docs.pytest.org/en/stable/getting-started.html).

#### Push the Changes

After writing and testing the package, commit the changes and push them to GitHub. Each push to the `main` branch will trigger a GitHub Actions workflow for continuous integration. For more details on GitHub Actions workflows, refer to [this documentation](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions).

Instead of pushing directly to the `main` branch, it is recommended to push to a separate branch and then create a pull request to merge into `main`. This allows changes to be reviewed and checked by GitHub Actions before merging. For more details on pull requests, refer to [this documentation](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).

### Releasing the Project

#### Specify Version Number

Update the version number of the package in the [`pyproject.toml`](./pyproject.toml) file to match the version you plan to release. The version number usually follows the semantic versioning system. Refer to [this documentation](https://packaging.python.org/en/latest/discussions/versioning/) for more information on versioning in Python projects.

#### Build the Package

Before releasing, check if the package can be built with:

```sh
uv build
```

This will create a source tarball and wheel distribution of the package under the `dist` directory. You can verify the contents of the package or install it locally to ensure that it is built correctly. For more information on building the package, refer to [this documentation](https://docs.astral.sh/uv/guides/package/#building-your-package).

#### Release on GitHub

Create a new tag in the `main` branch corresponding to the version number of the release, and then draft a new release using that tag. You can also include the source tarball and wheel distribution as assets in the release. Refer to [this documentation](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) for more information on managing releases on GitHub.
