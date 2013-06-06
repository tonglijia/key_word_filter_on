module FilterKeyWordOn

    def self.included(base)
      base.send :include, InstanceMethods
      base.send :extend, ClassMethods
    end

  class KeyWordFilter < ActiveRecord::Base
    attr_accessible :content, :replace
  end
  
  content, replace = ''
    
  def self.replacement_hash
    Hash[FilterKeyWordOn::KeyWordFilter.all.collect{|re| [re.content,re.replace] }]
  end

  def self.filter_word_tree(object = nil)
    word_tree = Array.new(256) << 0
    object = replacement_hash if object.nil?
    object.each do |word,replace|
      temp  = word_tree
      bytes = word.bytes.to_a
      len   = bytes.size

      bytes.each_with_index do |asicc_code,arr_index|
        if arr_index < len - 1
          if temp[asicc_code].nil?
            node = [Array.new(256),0]
            temp[asicc_code] = node
          elsif temp[asicc_code] == 1
            node = [Array.new(256),1]
            temp[asicc_code] = node
          else
          end
          temp = temp[asicc_code][0]
        else
          temp[asicc_code] = 1
        end
      end
    end
    [word_tree,0]
  end

  def self.handle_word(do_words,replace = true,word_tree = nil,word_hash = nil)
    word_tree = filter_word_tree if word_tree.nil?
    word_hash = replacement_hash if word_hash.nil?
    temp      = word_tree
    nodeTree  = word_tree
    words     = []
    word      = []
    to_replace= []
    a         = 0
    byte_words = do_words.bytes.to_a
    while a < byte_words.size
      index = byte_words[a]
      temp = temp[0][index]
      if temp.nil?
        temp = nodeTree
        a = a - word.size
        word = []
        to_replace = []
      elsif temp == 1 or temp[1] == 1
        word << index
        to_replace << a
        words << word

        if replace
          replace_word = word_hash[word.pack("C*").force_encoding("UTF-8")].bytes.to_a
          byte_words[(a-to_replace.size + 1),to_replace.size] = replace_word
          a = (a - to_replace.size + 1) + (replace_word.size - 1)
        else
          a = a - word.size + 1
        end
        word = []
        to_replace = []
        temp = nodeTree
      else
        word << index
        to_replace << a
      end
      a += 1
    end
    return byte_words.pack("C*").force_encoding("UTF-8") if replace
    words.collect{|e| e.collect{|ch|ch.chr}.join }
  end
 
end 
 