class Admin::AllowedSourcesDeleter
  def delete(params)
    return unless params && params[:allowed_sources].is_a?(ActionController::Parameters)

    ids = []

    params[:allowed_sources].values.each do |hash|
      ids << hash[:id] if hash[:destroy] == "1"
    end

    AllowedSource.where(namespace: "staff", id: ids).delete_all if ads.present?
  end
end
