class Admin::CityPicsController < AdminController
  def create
    @city = City.find(params[:city_id])
    @city.city_pic.attach(params[:city_pic])
    redirect_to(admin_city_path(@city))
  end

  def destroy
    @city = City.find(params[:city_id])
    @city.city_pic.purge
    redirect_back(fallback_location: root_path)
  end
end