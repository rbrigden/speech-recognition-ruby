require_relative 'speech_recognition'

speech = SpeechRecognition.new
speech.recognize "test.wav"
puts speech.to_text
