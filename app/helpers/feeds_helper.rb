module FeedsHelper
  def check_if_disabled(disabled_if,current_user,feed)
    if current_user.feeds.include?(feed)
      if !disabled_if
        'disabled'
      end
    else
      if disabled_if 
        'disabled'
      end
    end
  end
end
