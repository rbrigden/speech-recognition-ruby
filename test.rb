require_relative 'speech_recognition'

speech = SpeechRecognition.new
puts speech.recognize "test.wav"
