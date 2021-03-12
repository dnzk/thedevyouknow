#!/usr/bin/env bash

mix deps.get --only prod
MIX_ENV=prod mix compile

npm install --prefix ./apps/blog_web/assets
npm run deploy --prefix ./apps/blog_web/assets
npm install --prefix ./apps/admin_web/assets
npm run deploy --prefix ./apps/admin_web/assets
mix phx.digest

rm -rf "_build"
MIX_ENV=prod mix release
