class SavingsController < InheritedResources::Base

  private

    def saving_params
      params.require(:saving).permit(:user_id, :frequency_id, :title, :description, :amount, :saved_date)
    end
end

