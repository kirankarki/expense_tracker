# Making kaminari to be compactable with will_paginate for Active_Admin

Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end