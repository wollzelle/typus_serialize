# typus_serialize

Serialize module for Typus, adds support for editing serialized data.

* https://github.com/wollzelle/typus_serialize
* https://github.com/fesplugas/typus

## Installation

In your `Gemfile`:

    gem 'typus_serialize'

## Configuration

**In your model:**

    class Profile < ActiveRecord::Base
      typus_serialize :info, keys: %w(birthplace star_sign genre instrument url), limit: 1
      typus_serialize :music, keys: %w(title url), !ruby/range 1..6
      typus_serialize :videos, keys: %w(title video_url poster_url), !ruby/range 0..4
      ...

## Copyright

Copyright (c) 2011 Wollzelle GmbH. See LICENSE for details.