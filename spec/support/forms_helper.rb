module FormsHelper
  def fill_form!(klass, attrs)
    attrs.each do |key, value|
      label = I18n.t("activerecord.attributes.#{klass.to_s}.#{key}")
      fill_in label, with: value
    end
  end
end
