# Key::Word::Filter::On

## Getting started   

```ruby

	gem 'key-word-filter-on'

```

```ruby

	rails g key_word_filter_on:migration

```

Usage

```ruby

	content = FilterKeyWordOn.handle_word("content", "*")

 or

 	alias :origin_save :save 

	def save
		self.content = FilterKeyWordOn.handle_word(self.content, "*")
		self.origin_save
	end

```



