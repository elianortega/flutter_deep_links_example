# flutter_deep_links_example

More docs later ...

## Hosted Files

For the deep links implementation to work we need to host 2 files under your domain. If you don't know how to do it, contact your domain's admin.

Both of the following files need to be under `yourSite.com/.well-known/` folder.

For `ios` host the file `apple-app-site-association` without extension, but set the file meta tag to `Content Type: application/json`.

```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "<APPLE_TEAM_ID>.<BUNDLE_ID>",
        "paths": ["*", "/*"]
      }
    ]
  }
}
```

For `android` host the file `assetlinks.json` with extension.

```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "<BUNDLE_ID>",
      "sha256_cert_fingerprints": [
        "00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00"
      ]
    }
  }
]
```
