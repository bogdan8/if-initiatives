# frozen_string_literal: true

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent'
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: 'div', class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'mdl-textfield__label'

    b.use :input, class: 'mdl-textfield__input'
    b.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
  end

  config.wrappers :vertical_file_input, tag: 'div', class: 'file_input', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: 'image_input_button mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-js-ripple-effect mdl-button--colored'

    b.use :input, class: 'none file'
    b.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
  end

  config.wrappers :vertical_boolean, tag: 'div', class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'checkbox' do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: 'div', class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'mdl-textfield__label'
    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
  end

  config.wrappers :horizontal_form, tag: 'div', class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'mdl-textfield__label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :input, class: 'mdl-textfield__input'
      ba.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
    end
  end

  config.wrappers :horizontal_file_input, tag: 'div', class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: 'mdl-textfield__label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
    end
  end

  config.wrappers :horizontal_boolean, tag: 'div', class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'col-sm-offset-3 col-sm-9' do |wr|
      wr.wrapper tag: 'div', class: 'checkbox' do |ba|
        ba.use :label_input
      end

      wr.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
      wr.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: 'div', class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'mdl-textfield__label'

    b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
    end
  end

  config.wrappers :inline_form, tag: 'div', class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'sr-only'

    b.use :input, class: 'mdl-textfield__input'
    b.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
  end

  config.wrappers :multi_select, tag: 'div', class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label is-upgraded', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'mdl-textfield__label'
    b.wrapper tag: 'div', class: 'form-inline' do |ba|
      ba.use :input, class: 'mdl-textfield__input'
      ba.use :error, wrap_with: { tag: 'span', class: 'mdl-textfield__error' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'mdl-textfield__error' }
    end
  end
  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :vertical_form
  config.wrapper_mappings = {
    check_boxes: :vertical_radio_and_checkboxes,
    radio_buttons: :vertical_radio_and_checkboxes,
    file: :vertical_file_input,
    boolean: :vertical_boolean,
    datetime: :multi_select,
    date: :multi_select,
    time: :multi_select
  }
end