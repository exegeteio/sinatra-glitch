# Sinatra - Glitch

[Glitch](https://glitch.com/) is a wonderful service which makes it easy to
get sites and applications up and running quickly.  Know what else is wonderful?
Ruby!  This repo is intended to provide a cairn for getting a Ruby app (in this
case [Sinatra](http://sinatrarb.com/)), running on Glitch.

## `glitch.json`

The `glitch.json` file tells Glitch how to setup and launch your application.
The format is standard
[JSON](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON),
and only has a few keys that I am aware of.  The information below is taken
from a
[post](https://support.glitch.com/t/language-support-on-glitch-a-list/5466)
by [Annaia Berry](https://support.glitch.com/u/jarcane).

```yaml
{
  // What to run before the first time this app is launched?
  "install": "bundle install",
  // How to launch the app itself. $PORT is set at runtime.  It is almost
  // always 3000, but better safe than sorry.
  "start": "bundle exec rackup config.ru -p $PORT -s thin -o 0.0.0.0",
  // Which files to watch for changes?
  "watch": {
    // When to re-run the install.
    "install": {
      // When these files change...
      "include": [
        "^glitch\\.json$",
        "^Gemfile.lock",
        "^\\.env$"
      ],
      // But not these files.
      "exclude": [ ]
    },
    // When to restart the app.
    "restart": {
      // When these files change...
      "include": [
        ".rb$"
      ],
      // But not these files.
      "exclude": [
        "^vendor/bundle"
      ]
    },
    // Maximum frequency at which to restart the app, in milliseconds.
    "throttle": 1000
  }
}
```

## Hosted by [Glitch](https://glitch.com/)

**Glitch** is the friendly community where you'll build the app of your dreams. Glitch lets you instantly create, remix, edit, and host an app, bot or site, and you can invite collaborators or helpers to simultaneously edit code with you.

Find out more [about Glitch](https://glitch.com/about).

( ᵔ ᴥ ᵔ )
