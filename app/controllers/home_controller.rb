class HomeController < ApplicationController
  def index
  end

  def redeem
    cheatsheet_path = File.join(Rails.root, 'app','assets', 'pdfs', 'cheatsheet.pdf')
    send_file cheatsheet_path
  end
end
