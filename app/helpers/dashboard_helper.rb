module DashboardHelper
  
  def subscription_helper(today=Date.today)    
    (today + 360).strftime("%m/%d/%y")    
  end
end
