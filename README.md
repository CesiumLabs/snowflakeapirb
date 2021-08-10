# Snowflake API
An api wrapper for **[Snowflake API](https://api.snowflakedev.org)** written in Ruby.

# Example

```ruby
require "snowflakeapirb"

api = SnowflakeAPI.new("API_KEY")

puts api.chatbot("Hello")
```