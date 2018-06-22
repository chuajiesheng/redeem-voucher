class HomeController < ApplicationController
  def index
  end

  def redeem
    voucher_uuid = params.permit(:voucher)[:voucher]
    voucher = Voucher.find_by_uuid(voucher_uuid)

    if not voucher
      flash[:error] = 'Please provide a valid voucher code.'
      return redirect_to root_path
    end

    voucher.used = true
    voucher.save!

    cheatsheet_path = File.join(Rails.root, 'app','assets', 'pdfs', 'cheatsheet.pdf')
    send_file cheatsheet_path
  end
end
