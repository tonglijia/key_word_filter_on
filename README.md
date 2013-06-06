# Key::Word::Filter::On

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'key-word-filter-on'

Or install it yourself as:

    $ gem install key-word-filter-on

    rails g key_word_filter_on:migration

User:


## Usage

 	content = FilterKeyWordOn.handle_word("content", "*")
 
 or

 	alias :origin_save :save 

	def save
		self.content = FilterKeyWordOn.handle_word(self.content, "*")
		self.origin_save
	end




## Contributing

