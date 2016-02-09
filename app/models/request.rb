class Request < ActiveRecord::Base
  # Add validation to ensure that there is a name and email

  validates :name, presence: true
  validates :email, presence: true

  # Sort
  def self.sort_by_status
    order("status DESC")
  end

  # Search method here!
  def self.wildcard_search(str)
  where(["name ILIKE ? OR email ILIKE ? OR message ILIKE ? OR department ILIKE?", "%#{str}%", "%#{str}%","%#{str}%", "%#{str}%"])
  end

  def self.search(str)
    if str
      find(:all, :conditions => ["name ILIKE ? OR email ILIKE ? OR message ILIKE ? OR department ILIKE?", "%#{str}%", "%#{str}%","%#{str}%", "%#{str}%"])
    else
      find(:all)
    end
  end

  # def self.fill_status
  #   where("status = nil").each do |element|
  #     element.update(status: "Un-done")
  #   end
  # end
end
