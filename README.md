# typus_serialize

Typus module for editing serialized data

https://github.com/wollzelle/typus_serialize
https://github.com/fesplugas/typus

## Installation

In your `Gemfile`:

    gem 'typus_serialize'

## Configuration

**In your model:**

    class Profile < ActiveRecord::Base
      serialize :info
      serialize :music
      serialize :videos
      ...

**In `config/typus/application.yml`**

    Profile:
      fields:
        form: name, info, music, videos
        options:
          serialize:
            info: birthplace, star_sign, genre, instrument, url
            music: title, url
            videos: title, video_url, poster_url
            options:
              limit:
                info: 1
                music: !ruby/range 1..6
                videos: !ruby/range 0..4


## Copyright

Copyright (c) 2011 Wollzelle GmbH. See LICENSE for details.