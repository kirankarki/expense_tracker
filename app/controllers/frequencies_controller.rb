class FrequenciesController < InheritedResources::Base

  private

    def frequency_params
      params.require(:frequency).permit(:name)
    end
end

