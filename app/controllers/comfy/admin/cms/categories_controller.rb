class Comfy::Admin::Cms::CategoriesController < Comfy::Admin::Cms::BaseController

  before_action :load_category,  :only => [:edit, :update, :destroy]
  before_action :authorize

  def edit
    render
  end

  def create
    @category = @site.categories.create!(category_params)
  rescue ActiveRecord::RecordInvalid
    render :nothing => true
  end

  def update
    @category.update_attributes!(category_params)
  rescue ActiveRecord::RecordInvalid
    render :nothing => true
  end

  def destroy
    @category.destroy
  end

protected

  def load_category
    @category = @site.categories.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :nothing => true
  end

  def category_params
    params.fetch(:category, {}).permit!
  end

end