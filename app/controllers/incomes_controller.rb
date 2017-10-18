class IncomesController < InheritedResources::Base

  private

    def income_params
      params.require(:income).permit(:title, :description, :amount, :received_date, :user_id, :frequency_id)
    end
end

