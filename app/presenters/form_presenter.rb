class FormPresenter
  include HtmlBuilder

  attr_reader :form_builder, :view_context
  delegate :label, :text_field, :date_field, :password_field, :check_box, :radio_button, :text_area, :object, to: :form_builder

  def initialize(form_builder, view_context)
    @form_builder = form_builder
    @view_context = view_context
    @current_options = {}
  end

  def decorated_label(name, text = nil, options = {})
    form_builder.label(name, text, options.merge(class: "decorated-label"))
  end
  
  # with_options для required и других опций
  def with_options(options = {})
    @current_options = options
    yield self
  ensure
    @current_options = {}
  end

  def notes
    ""
  end

  def text_field_block(name, label_text = nil, options = {})
  label_text ||= I18n.t("activerecord.attributes.#{object.model_name.i18n_key}.#{name}")
  merged_options = options.merge(@current_options || {})
  merged_options[:class] = [merged_options[:class], ("error-field" if object.errors[name].any?)].compact.join(" ")

    markup(:div, class: "input-block") do |m|
      m << decorated_label(name, label_text, merged_options)
      m << text_field(name, merged_options)
      if options[ :maxlength ]
        m.span " (#{options[:maxlength]}文字列以内) ", class: "instruction"
      end
      m << error_messages_for(name)
    end
  end

  def number_field_block(name, label_text = nil, options = {})
    markup(:div) do |m|
      m << decorated_label(name, label_text, options)
      m << form_builder.number_field(name, options)
      if options[:max]
        max = view_context.number_with_delimiter(options[:max].to_i)
        m.span " (最大値: #{max}) ", class: "instruction"
      end
      m << error_messages_for(name)
    end
  end

  def date_field_block(name, label_text = nil, options = {})
    label_text ||= I18n.t("activerecord.attributes.#{object.model_name.i18n_key}.#{name}") rescue name.to_s
    merged_options = options.merge(@current_options || {})
    markup(:div, class: "input-block") do |m|
      m << decorated_label(name, label_text, merged_options)
      m << date_field(name, merged_options)
      m << error_messages_for(name) if object.respond_to?(:errors)
    end
  end

  def drop_down_list_block(name, label_text, choices, options = {})
    markup(:div, class: "input-block") do |m|
      m << decorated_label(name, label_text, options)
      m << form_builder.select(name, choices, { include_blank: true }, options)
      m << error_messages_for(name) if object.respond_to?(:errors)
    end
  end

  def password_field_block(name, label_text, options = {})
    merged_options = options.merge(@current_options || {})
    markup(:div, class: "input-block") do |m|
      m << decorated_label(name, label_text, merged_options)
      m << password_field(name, merged_options)
      m << error_messages_for(name) if object.respond_to?(:errors)
    end
  end

  def error_messages_for(name)
    return "" unless object.respond_to?(:errors)

    markup do |m|
      object.errors.full_messages_for(name).each do |message|
        m.div(class: "error-message") do |m|
          m.text message
        end
      end
      
      def decorated_label(name, label_text, options = {})
        label(name, label_text, class: options[:required] ? "required" : nil)
      end
  end
  end
end
