class Groupgrant < ActiveRecord::Base
   belongs_to :charity, :foreign_key => "owner_id"
   belongs_to :business, foreign_key: "partner_id"
end