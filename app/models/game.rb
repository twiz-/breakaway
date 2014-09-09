class Game < ActiveRecord::Base
  
  validates :location, :opponent, :scheduled_date, :scheduled_time, presence: true
  
  belongs_to :club_player
  
  def self.to_csv(games)
    CSV.generate do |csv|
      column_names = ["scheduled_date", "scheduled_time","opponent", "location"]
      csv << column_names
      games.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
  def self.to_csv_favorites(games)
    CSV.generate do |csv|
      column_names = ["scheduled_date","scheduled_time","opponent","location", 'team','name']
      csv << column_names
      games.each do |item|
        row = item.attributes.values_at(*column_names)
        row << ClubPlayer.find(item.club_player_id).club_team
        row << ClubPlayer.find(item.club_player_id).last_name        
        row.delete_if { |el| el.nil? }
        csv << row
      end
    end
  end
  
end
