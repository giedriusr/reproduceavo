class Avo::Resources::Page < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :slug, as: :text
    field :content, as: :text
    field :labels, as: :tags, hide_on: :show, delimiters: [";"], placeholder: "Comma separated list"
  end

  def show_fields
    fields

    field :labels, as: :tags

    field :page_url, as: :text do
      url_params = {slug: resource.record.slug, id: resource.record}
      link_to main_app.page_url(url_params), main_app.page_url(url_params), target: "_blank"
    end
  end
end
