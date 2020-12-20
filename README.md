# justingardner.com

Website for Justin Gardner

- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Infrastructure](#infrastructure)
- [Environment Variables](#environment-variables)
- [CI/CD](#cicd)
  - [CI](#ci)
  - [Release](#release)

## Requirements

- [docker](https://docs.docker.com/install/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [mkcert](https://github.com/FiloSottile/mkcert)
- [node.js](https://nodejs.org/en/)
- [yarn](https://yarnpkg.com/en/docs/install)

## Getting Started

The following steps will spin up a local dev server running over HTTPS

- Make sure the following line is in your **_/etc/hosts_** file:

```
127.0.0.1    localhost.justingardner.com
```

- Run `mkcert -install` once to created a new local CA. This allows us to serve localhost over HTTPS.
- Run `make` to start local dev server at https://localhost.justingardner.com
- Run `make stop` to stop local dev server

## Infrastructure

The `.iac` folder builds these AWS resources:

- ACM SSL Cert
- S3 for hosting static files
- Cloudfront for caching/SSL cert application
- Route 53 - for DNS routing
- IAM for CICD

## Environment Variables

| Key | Description | Default | Required |
| --- | ----------- | :-----: | :------: |
|     |             |         |          |

## CI/CD

Continuous integration and deployment jobs are run via [GitHub Actions](https://github.com/features/actions).
See **.github/workflows** for workflow configurations.

### CI

- Runs build and test on all branches

### Release

- Builds and deploys to **dev** on every **prerelease tag** (v1.2.4-pre.0, v2.0.0-rc.5)
- Builds and deploys to **prod** on every **release tag** (v3.4.5)
