//= require rails-ujs
//= require turbolinks
//= require_tree .
import Rails from '@rails/ujs'
import './staff'
Rails.start()

import '../staff/customer_form.js'
import '../staff/entries_form'
