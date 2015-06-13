# author: Ryan Brigden
# date: June 12, 2015

require 'json'

# require AT&T codekit
require 'att/codekit'
include Att::Codekit


class SpeechRecognition

	attr_reader :client
	attr_reader :scope
	attr_reader :response

	def initialize
		id = ENV['ATT_KEY']
		secret = ENV['ATT_SECRET']
		@client = Auth::ClientCred.new('https://api.att.com', id, secret)
		@scope = "SPEECH"
		@response
	end

	def get_token
		# get token from client
		return @client.createToken(@scope)
	end

	def recognize path_to_file
		speech = Service::SpeechService.new('https://api.att.com', get_token)
		begin
			res = speech.toText(path_to_file)
		rescue Service::ServiceException => e
			# Display any error returned codes 
			puts "#{e.message}"
		else
			# return the data 
			@response = res
  		end
  	end


end



