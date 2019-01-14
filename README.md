## Introduction

This project is a an example of [Amber](https://amberframework.org/) web framework for a Web API.

The database engine used by the project is [SQLite](https://www.sqlite.org/).

### Getting Started

First, follow [Amber](https://docs.amberframework.org/amber/guides/installation) instructions to install the Amber CLI.

To create and migrate the database:

1. Initialize database with `amber db create`
2. Migrate database with `amber db migrate`

To start the Amber server:

1. Install dependencies with `shards install`
2. Build executables with `shards build`
3. Start Amber server with `bin/amber_webapi`

Now you can visit http://localhost:3000/api from your browser.
