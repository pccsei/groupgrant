class Groupgrant < ActiveRecord::Base
   belongs_to :charity,  			:foreign_key => "owner_id"
   belongs_to :business, 			:foreign_key => "partner_id"
   belongs_to :groupgrant_category, :foreign_key => "category_id"
   has_attached_file :groupgrant_pic, :styles => { :medium => "300x300>", 
      :small => "200x200>", :thumb => "100x100>"}, :default_url => "medium/missing.png"
   validates :name, :category_id, :goal_amount, :goal_date, presence: 
      {is: true, message: "This field is required"}
   validates :name, length: {in: 2..100, too_short: "A name can't be one character"}
   validates :goal_amount, numericality: {is: true, message: "Must be numbers"}


   def self.search(search)
     if search
       temp1 = Groupgrant.all(:conditions => ['name LIKE ?', "%#{search}%"])
       temp2 = Groupgrant.all(:conditions => ['description LIKE ?', "%#{search}%"])
       (temp1 + temp2).uniq 
     else
       find(:all)
     end
   end

   def progress
    begin
      if self.goal_status.nil? || self.goal_amount.nil?
        Rails.logger.info("progress def")
        Rails.logger.info("goal_studs")
        Rails.logger.info(self.goal_status)
        Rails.logger.info("goalamount")
        Rails.logger.info(self.goal_amount)
        return 0
      else
         Rails.logger.info("progress def")
        Rails.logger.info("goal_studs")
        Rails.logger.info(self.goal_status)
        Rails.logger.info("goalamount")
        Rails.logger.info(self.goal_amount)
         Rails.logger.info("computeed")
         Rails.logger.info( self.goal_status / self.goal_amount * 100)
        self.goal_status / self.goal_amount * 100
      end
rescue => error
  Rails.logger.info("computeed error")
  Rails.logger.info(error.message)
end
   end

   def days_left
      (self.goal_date - Time.now).to_i
   end

   auto_html_for :video_url do
      html_escape
      image(:class => 'profile_video')
      youtube(:class => 'profile_video')
      dailymotion(:class => 'profile_video')
      vimeo(:class => 'profile_video')
      metacafe(:class => 'profile_video')
      soundcloud(:class => 'profile_video')
      twitter 
      google_map
      google_video
      flickr
      link :target => "_blank", :rel => "nofollow"
      simple_format
   end
   
end