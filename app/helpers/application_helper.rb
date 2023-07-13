module ApplicationHelper
    def departement_select(form, attribute)
      form.select attribute, ISO3166::Country.find_country_by_alpha2('FR').subdivisions.map { |code, subdivision| [subdivision.name, subdivision.name] }
    end
  end
  