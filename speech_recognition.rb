# author: Ryan Brigden
# date: June 12, 2015

require 'json'

# require AT&T codekit
require 'att/codekit'
include Att::Codekit


class SpeechRecognition

	attr_reader :client
	attr_reader :scope
	attr_reader :result

	def initialize
		id = ENV['ATT_KEY']
		secret = ENV['ATT_SECRET']
		@client = Auth::ClientCred.new('https://api.att.com', id, secret)
		@scope = "SPEECH"
		@result = {}
	end

	def get_token
		# get token from client
		return @client.createToken(@scope)
	end

	def recognize path_to_file
		speech = Service::SpeechService.new('https://api.att.com', get_token)
		begin
			response = speech.toText(path_to_file)
		rescue Service::ServiceException => e
			# Display any error returned codes 
			puts "#{e.message}"
		else
			# return the data in hash
			response.nbest.first.each_pair do |key, value|
				@result[key] = value
			end 
			@result["accuracies"] = create_accuracy_hash @result[:words], @result[scores]
  		end
  	end

  	def to_text
  		@result[:hypothesis]
  	end

  	private

  	def create_accuracy_hash words, scores
  		arr = []
  		words.each do |word|
  			scores.each do |score|
  				arr.push([word, score])
  			end
  		end
  		Hash[arr]
  	end


end



