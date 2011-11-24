# typus_serialize

Serialize module for [Typus](https://github.com/fesplugas/typus), adds support for editing serialized data.

## Installation

In your `Gemfile`:

    gem 'typus_serialize'

## Configuration

In your model:

    class Profile < ActiveRecord::Base
      typus_serialize :info, keys: %w(birthplace star_sign genre instrument url)
      typus_serialize :music, keys: %w(title url)
      typus_serialize :videos, keys: %w(title video_url poster_url)      
      ...

`limit` can be used to set how many instances of an attribute are allowed:

    class Profile < ActiveRecord::Base
      typus_serialize :info, keys: %w(birthplace star_sign genre instrument url), limit: 1
      typus_serialize :music, keys: %w(title url), !ruby/range 1..6
      typus_serialize :videos, keys: %w(title video_url poster_url), !ruby/range 0..4
      ...
      
## Translation

`typus_serialize` supports translatable attributes through the [`typus_translate`](https://github.com/wollzelle/typus_translate) gem.

In your model:

    class Profile < ActiveRecord::Base
      typus_translate :bio, :info
      typus_serialize :info, keys: %w(birthplace star_sign genre instrument url), limit: 1

In your `typus.yml`:

    Profile:
      fields:
        form: bio, info

**Note:** A field using `typus_serialize` (e.g. `info`) cannot be the first in a form.
A regular non-serialized field (e.g. `bio`) must be used first to setup the translations.
This is a limitation that will be fixed in a future release.


## Copyright

Copyright (c) 2011 Wollzelle GmbH. See LICENSE for details.