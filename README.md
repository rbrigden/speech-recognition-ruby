# speech-recognition-ruby

Speech recognition in Ruby using the AT&amp;T API. 

## Requirements

* Ruby 1.9.3 or higher (Ruby 2.1 recommended)
* AT&T Codekit (install below)
* AT&T Developer API Credentials

## Setup

Install AT&T API Codekit

Add the server host of the gem file:

    $ gem sources --add http://lprod.code-api-att.com:8808

Install the gem:

    $ gem install att-codekit

## Example Usage

```ruby
  # simple example to transcribe audio
    
  require_relative 'speech_recognition'

  # transcribe the audio
  speech = SpeechRecognition.new
  speech.recognize "test.wav"
  puts speech.to_text
  
```
...and with a little more detail

```ruby
    #retrieve other data from query, passed as hash
    require_relative 'speech_recognition'
    
    # transcribe the audio
    speech = SpeechRecognition.new
    speech.recognize "test.wav"
   
    # retrieve result as hash
    output = speech.result
    
    # get the output text
    text = output[:hypothesis]
    
    # get the confidence of the recognition
    confidence = output[:confidence]
    
    # get a hash of the words with their indidividual accuracies ( from 0 to 1 )
    accuracies = output[:accuracies]
    
    # get language
    lang = output[:language]

```

Enjoy!
  







