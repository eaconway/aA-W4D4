module ApplicationHelper
  def auth_token
    "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>".html_safe
  end

  def delete_band(band)
    "<form action='#{band_url}(#{band})' method='post'>
      #{auth_token}
      <input type='hidden' name='_method' value='delete'>
      <input type='submit' name='submit' value='Delete Band!'>
    </form>".html_safe
  end

  def delete_album(album)
    "<form action='#{album_url}(#{album})' method='post'>
      #{auth_token}
      <input type='hidden' name='_method' value='delete'>
      <input type='submit' name='submit' value='Delete Album!'>
    </form>".html_safe
  end

end
