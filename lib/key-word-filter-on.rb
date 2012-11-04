require "active_record"
require "filter_key_word_on/key_word"

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend FilterKeyWordOn
end

 