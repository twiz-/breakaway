class Game < ActiveRecord::Base
  
  validates :location, :opponent, :scheduled_date, :scheduled_time, presence: true
  
  belongs_to :player
  
  def self.to_csv(games)
    CSV.generate do |csv|
      csv << column_names
      games.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
  
end
