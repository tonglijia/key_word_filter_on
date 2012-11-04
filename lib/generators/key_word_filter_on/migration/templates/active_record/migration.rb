class CreateKeyWordFilters < ActiveRecord::Migration
  def self.up
    create_table :key_word_filters do |t|
      t.column  :content,           :string                    # 过滤内容
      t.column  :replace,           :string                    # 替换字符
      t.timestamps
    end
    
    # 初始化关键字数据信息
    path = "#{Rails.root}/config/key_word_filters.da"
    File.open(path) do |file|
      #say "init key_word_datas"
      file.each_line{|line| FilterKeyWordOn::KeyWordFilter.create(:content => line.strip, :replace => "**") }  #添加数据
    end   if File.exist?(path)
  end

  def self.down
    drop_table :key_word_filters
  end
end