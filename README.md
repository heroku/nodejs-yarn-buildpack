# Node.js Yarn Cloud Native Buildpack (MOVED)

This repo has moved to https://github.com/heroku/buildpacks-node.

This buildpack builds on top of the existing [Node.js Engine Cloud Native Buildpack](https://github.com/heroku/nodejs-engine-buildpack). It runs subsequent scripts after Node is install.

- Run automatically
  - `yarn install`
- Run when configured in `package.json`
  - `yarn build` or `yarn heroku-postbuild`

## Usage

This buildpack is meant to be used with `heroku/nodejs-engine` version `0.7.3`.

```
$ pack build --buildpack heroku/nodejs-engine@0.7.3 --buildpack fagiani/nodejs-yarn myapp
```

### Define a custom path for yarn (optional)

You can optionally create a `yarn.lock` file in the root directory with a line like this:

```
# yarn_path:public/my-custom-path
```

Make sure you place the actual `package.json` and `yarn.lock` in that path

## Contributing

1. Open a pull request.
2. Make update to `CHANGELOG.md` under `master` with a description (PR title is fine) of the change, the PR number and link to PR.
3. Let the tests run on CI. When tests pass and PR is approved, the branch is ready to be merged.
4. Merge branch to `master`.

### Release

Note: if you're not a contributor to this project, a contributor will have to make the release for you.

1. Create a new branch (ie. `1.14.2-release`).
2. Update the version in the `buildpack.toml`.
3. Move the changes from `master` to a new header with the version and date (ie. `1.14.2 (2020-02-30)`).
4. Open a pull request.
5. Let the tests run on CI. When tests pass and PR is approved, the branch is ready to be merged.
6. Merge branch to `master`.
7. Pull down `master` to local machine.
8. Tag the current `master` with the version. (`git tag v1.14.2`)
9. Push up to GitHub. (`git push origin master --tags`) CI will run the suite and create a new release on successful run.

## Glossary

- buildpacks: provide framework and a runtime for source code. Read more [here](https://buildpacks.io).
- OCI image: [OCI (Open Container Initiative)](https://www.opencontainers.org/) is a project to create open sourced standards for OS-level virtualization, most importantly in Linux containers.
