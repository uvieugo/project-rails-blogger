class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings

    # def tag_list
    #     self.tags.collect do |tag|
    #         tag.name
    #     end.join(", ")  
    # end

    def tag_list
        tags.join(", ")
    end

    def tag_list=(tags_string)
        # split tag string
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        # loop thru tag_names, find or create the new tags
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        #attach found tags to article
        self.tags = new_or_found_tags

    end
end
