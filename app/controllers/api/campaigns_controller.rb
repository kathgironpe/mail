module Api
  # Handle data for sending campaigns
  class CampaignsController < BaseController
    def show
      mailing = Mailing.get_mailings(params[:id])

      res = campaign_data(mailing)

      render json: res
    end

    private

    def campaign_data(mailing)
      MailingSerializer.new(mailing).campaign_data
    end
  end
end
