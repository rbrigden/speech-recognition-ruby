# speech-recognition-ruby
Speech recognition script in Ruby using the AT&amp;T API

## Requirements

Ruby 1.9.3 or higher (Ruby 2.1 recommended)
AT&T Codekit (install below)
AT&T Developer API Credentials

## Setup

Install AT&T API Codekit

Add the server host of the gem file:

    $ gem sources --add http://lprod.code-api-att.com:8808

Install the gem:

    $ gem install att-codekit

## Example Usage

```ruby

  require_relative 'speech_recognition'

  speech = SpeechRecognition.new
  speech.recognize "test.wav"
  puts speech.to_text
  
```

####Enjoy!
  







