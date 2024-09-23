# Static JSON

This repo is a place for storing static JSON values I reference in various apps/configs/APIs.

## Setup

When setting up the Action for this repo, generate a fine-grained token with "Contents" set to "Read and write", save the token in the repository's Settings > Secrets and variables > Actions > Repository secrets. Then go to the repository's Settings > Actions > General and set "Workflow permissions" to "Read and write permissions."

## Goodreads

To update Goodreads, [go here](https://www.goodreads.com/review/import), click "Export library" to generate a .csv of my reading history, click "Your export..." to download it, then you'll need to manually upload that .csv to this repo. A GitHub Action will automatically trigger that will update the JSON value counting how many books I've read.
