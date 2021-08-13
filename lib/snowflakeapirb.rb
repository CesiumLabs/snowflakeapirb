# frozen_string_literal: true

require "faraday"
require "json"
require "date"
require_relative "snowflakeapirb/meme"
require_relative "snowflakeapirb/pokemon"
require_relative "snowflakeapirb/deno"
require_relative "snowflakeapirb/npm"
require_relative "snowflakeapirb/me"
require_relative "snowflakeapirb/github"
require_relative "snowflakeapirb/pypi"
require_relative "snowflakeapirb/token_info"
class SnowflakeAPI
	def initialize(api_key)
		@token = api_key
		@connection = Faraday.new(
			url: "https://api.snowflakedev.org/api",
			headers: {
				"Content-Type" => "application/json",
				"Authorization" => @token
			}
		)
	end

	# Get response from the chatbot
	# @param message [String] The message
	# @param name [String] The chatbot's name
	# @param age [String] The chatbot's age
	# @param gender [String] The bot's gender
	# @param user [String] The user identifier
	# @return [String]
	def chatbot(message, name: nil, age: nil, gender: nil, user: nil)
		resp = @connection.get("chatbot", { message: message, name: name, age: age, gender: gender, user: user })
		data = JSON.parse(resp.body)
		
		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data["message"]
		end
	end

	# Generates fake discord bot token
	# @return [String]
	def fake_discord_token
		resp = @connection.get("token")
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data["token"]
		end
	end
	
	# Returns meme from 
	# @param subreddit [String] subreddit to fetch meme from
	# @return [Hash]
	def meme(subreddit)
		resp = @connection.get("meme", { "sbr" => subreddit })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			Spreader::Meme.new(data)
		end
	end

	# Returns random roast message
	# @return [String]
	def roast
		resp = @connection.get("roast")
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data["roast"]
		end
	end

	# Returns Pokemon info
	# @param name [String] Pokemon name
	# @return [Spreader::Pokemon]
	def pokemon(name)
		resp = @connection.get("pokemon", { "name" => name })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			Spreader::Pokemon.new(data)
		end
	end

	# Encodes the given text to morse code
	# @param message [String] The message to encode
	# @return [String]
	def morse_encode(message)
		resp = @connection.get("morse/encode", { "text" => message })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data["data"]
		end
	end

	# Decodes the given morse code to regular text
	# @param message [String] The morse code to decode
	# @return [String]
	def morse_decode(message)
		resp = @connection.get("morse/decode", { "text" => message })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data["data"]
		end
	end

	# Returns package information from denoland registry
	# @param module [String] The module name
	# @return [Spreader::Deno]
	def deno(package)
		resp = @connection.get("registry/deno", { "module" => package })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			Spreader::Deno.new(data)
		end
	end

	# Returns package information from npmjs registry
	# @param module [String] The module name
	# @return [Spreader::Npm]
	def npm(package)
		resp = @connection.get("registry/npm", { "module" => package })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			Spreader::Npm.new(data)
		end
	end

	# Returns package information from pypi registry
	# @param module [String] The module name
	# @return [Spreader::Pypi]
	def pypi(package)
		resp = @connection.get("registry/pypi", { "module" => package })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			Spreader::Pypi.new(data)
		end
	end

	# Reverse the given text
	# @param message [String] The message to reverse
	# @return [String]
	def reverse(message)
		resp = @connection.get("reverse", { "message" => message })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data["message"]
		end
	end

	# Encode the given text to base64 string
	# @param message [String] The message to encode
	# @return [String]
	def base64_encode(message)
		resp = @connection.get("base64/encode", { "data" => message })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data["data"]
		end
	end

	# Decode the given text to base64 string
	# @param message [String] The message to decode
	# @return [String]
	def base64_decode(message)
		resp = @connection.get("base64/decode", { "data" => message })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data["data"]
		end
	end

	# Returns information about a discord token
	# @param token [String] The discord token
	# @return [Spreader::Token_info]
	def tokeninfo(token)
		resp = @connection.get("tokeninfo", { "token" => token })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			Spreader::Token_info.new(data)
		end
	end

	# Returns API server status
	# @return [Hash]
	def stats
		resp = @connection.get("stats")
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data
		end
	end

	# Returns information about current user
	# @return [Spreader::Me]
	def me
		resp = @connection.get("me")
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			Spreader::Me.new(data)
		end
	end

	# Returns information about a github user
	# @param user [String] The user's name
	# @return [Spreader::Github_Stats]
	def githubstats(user)
		resp = @connection.get("githubstats", { "username" => user })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			Spreader::Github_Stats.new(data)
		end
	end
end
