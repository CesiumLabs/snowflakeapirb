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
	def meme(subreddit: nil)
		resp = @connection.get("meme", { "sbr" => subreddit })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
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
	# @return [Hash]
	def pokemon(name)
		resp = @connection.get("pokemon", { "name" => name })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return {
				"name" => data["name"],
				"id" => data["id"],
				"base_experience" => data["baseExperience"],
				"height" => data["height"],
				"weight" => data["weight"],
				"type" => data["type"],
				"moves" => data["moves"],
				"stats" => data["stats"],
				"image" => data["image"]
			}
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
	# @return [Hash]
	def deno(package)
		resp = @connection.get("registry/deno", { "module" => package })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return {
				"registry" => data["registry"],
				"icon" => data["icon"],
				"url" => data["url"],
				"module" => {
					"name" => data["module"]["name"],
					"url" => data["module"]["url"],
					"description" => data["module"]["description"],
					"version" => data["module"]["version"],
					"stars" => data["module"]["stars"],
					"developer" => {
						"name" => data["module"]["developer"]["name"],
						"url" => data["module"]["developer"]["url"],
					},
					"github" => data["module"]["github"],
					"created_at" => Date.parse(data["module"]["createdAt"])
				}
			}
		end
	end

	# Returns package information from npmjs registry
	# @param module [String] The module name
	# @return [Hash]
	def npm(package)
		resp = @connection.get("registry/npm", { "module" => package })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return {
				"registry" => data["registry"],
				"icon" => data["icon"],
				"url" => data["url"],
				"runkit" => data["runkit"],
				"module" => {
					"name" => data["module"]["name"],
					"url" => data["module"]["url"],
					"description" => data["module"]["description"],
					"version" => data["module"]["version"],
					"main" => data["module"]["main"],
					"license" => data["module"]["license"],
					"author" => data["module"]["author"],
					"maintainers" => data["module"]["maintainers"],
					"dependencies" => data["module"]["dependencies"],
					"repository" => {
						"type" => data["module"]["repository"]["type"],
						"url" => data["module"]["repository"]["url"],
					},
					"banner" => data["module"]["banner"]
				}
			}
		end
	end

	# Returns package information from pypi registry
	# @param module [String] The module name
	# @return [Hash]
	def pypi(package)
		resp = @connection.get("registry/pypi", { "module" => package })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return {
				"registry" => data["registry"],
				"icon" => data["icon"],
				"url" => data["url"],
				"module" => {
					"name" => data["module"]["name"],
					"description" => data["module"]["description"],
					"url" => data["module"]["url"],
					"version" => data["module"]["version"],
					"author" => data["module"]["author"],
					"updated_at" => Date.parse(data["module"]["updatedAt"]),
					"documentation" => data["module"]["documentation"],
					"homepage" => data["module"]["homepage"]
				}
			}
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
	# @return [Hash]
	def tokeninfo(token)
		resp = @connection.get("tokeninfo", { "token" => token })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return {
				"type" => data["type"],
				"token" => data["token"],
				"id" => data["id"],
				"username" => data["username"],
				"discriminator" => data["discriminator"],
				"avatar" => data["avatar"],
				"avatar_url" => data["avatarURL"],
				"snowflake_info" => {
					"epoch" => data["snowflakeInfo"]["epoch"],
					"timestamp" => data["snowflakeInfo"]["timestamp"],
					"worker_id" => data["snowflakeInfo"]["workerID"],
					"process_id" => data["snowflakeInfo"]["processID"],
					"increment" => data["snowflakeInfo"]["increment"],
					"binary" => data["snowflakeInfo"]["binary"],
					"date" => Date.parse(data["snowflakeInfo"]["date"]),
					"snowflake" => data["snowflakeInfo"]["snowflake"]
				}
			}
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
	# @return [Hash]
	def me
		resp = @connection.get("me")
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return {
				"user" => data["user"],
				"pro" => data["pro"],
				"ratelimits" => data["ratelimits"],
				"banned" => data["banned"],
				"requests" => data["requests"],
				"token_created_timestamp" => data["tokenCreatedTimestamp"],
				"created_timestamp" => data["createdTimestamp"]
			}
		end
	end

	# Returns information about a github user
	# @param user [String] The user's name
	# @return [Hash]
	def githubstats(user)
		resp = @connection.get("githubstats", { "username" => user })
		data = JSON.parse(resp.body)

		if data["error"] and data["code"] and data["code"] != 200
			raise RuntimeError.new("[#{data["code"]}] #{data["error"] or "Rejected with status code #{data["code"]}"}")
		else
			return {
				"name" => data["name"],
				"avatar" => data["avatar"],
				"followers" => data["followers"],
				"repos" => data["repos"],
				"pull_requests" => data["pullRequests"],
				"issues" => data["issues"],
				"npm_downloads" => data['npmDownloads']
			}
		end
	end
end
