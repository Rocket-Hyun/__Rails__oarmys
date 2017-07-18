class Membership < ActiveRecord::Base
    belongs_to :user
    
    serialize :category,Array

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |membership|
        csv << membership.attributes.values_at(*column_names)
      end
    end
  end

end
