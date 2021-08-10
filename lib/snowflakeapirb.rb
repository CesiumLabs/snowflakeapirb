# frozen_string_literal: true

require "faraday"
require "json"
require "date"

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
			raise RuntimeError.new("#{data["code"]} #{data["error"] or "Rejected with status code #{data["code"]}"}")
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
			raise RuntimeError.new("#{data["code"]} #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return data["token"]
		end
	end
	
	# Returns meme from 
	# @param subreddit [String] subreddit to fetch meme from
	# @return [Hash]
	def meme(subreddit: nil)
		resp = @connection.get("meme", { "sbr" => subreddit })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("#{data["code"]} #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return {
				"is_video" => data["isVideo"],
				"nsfw" => data["nsfw"],
				"created_at" => Date.parse(data["createdAt"]),
				"url" => data["url"],
				"upvotes" => data["ratings"]["upvote"],
				"downvotes" => data["ratings"]["downvote"],
				"comments" => data["ratings"]["comments"],
				"subreddit" => data["subreddit"],
				"title" => data["title"],
				"link" => data["link"]
			}
		end
	end
end
