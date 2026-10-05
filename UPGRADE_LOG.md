### bin/rails zeitwerk:check
`/Users/vladikhan` is not writable.
Bundler will use `/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/bundler20261003-47679-ptf7m147679' as your home directory temporarily.
rails aborted!
ArgumentError: unknown keyword: create_additions
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/environment.rb:5:in `<main>'
Tasks: TOP => zeitwerk:check => environment
(See full trace by running task with --trace)

### bin/rails assets:precompile
`/Users/vladikhan` is not writable.
Bundler will use `/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/bundler20261003-47712-84bdlw47712' as your home directory temporarily.
rails aborted!
ArgumentError: unknown keyword: create_additions
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/environment.rb:5:in `<main>'
Tasks: TOP => environment
(See full trace by running task with --trace)

### bin/rails runner 'puts Rails.version'
`/Users/vladikhan` is not writable.
Bundler will use `/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/bundler20261003-47731-sy3t1i47731' as your home directory temporarily.
6.1.7.10

### bin/rails routes | head
                                  Prefix Verb   URI Pattern                                                                                       Controller#Action
                              staff_root GET    /                                                                                                 staff/top#index {:host=>"baukis2.example.com"}
                             staff_login GET    /login(.:format)                                                                                  staff/sessions#new {:host=>"baukis2.example.com"}
                           staff_session POST   /login(.:format)                                                                                  staff/sessions#create {:host=>"baukis2.example.com"}
                            staff_logout DELETE /logout(.:format)                                                                                 staff/sessions#destroy {:host=>"baukis2.example.com"}
                      edit_staff_account GET    /account/edit(.:format)                                                                           staff/accounts#edit {:host=>"baukis2.example.com"}
                           staff_account GET    /account(.:format)                                                                                staff/accounts#show {:host=>"baukis2.example.com"}
                                         PATCH  /account(.:format)                                                                                staff/accounts#update {:host=>"baukis2.example.com"}
                                         PUT    /account(.:format)                                                                                staff/accounts#update {:host=>"baukis2.example.com"}
                     edit_staff_password GET    /password/edit(.:format)                                                                          staff/passwords#edit {:host=>"baukis2.example.com"}

000
Checking log/development.log for exceptions:
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'

### Checking for deprecation warnings

### bin/rails zeitwerk:check
`/Users/vladikhan` is not writable.
Bundler will use `/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/bundler20261003-48649-zxdo8i48649' as your home directory temporarily.
Hold on, I am eager loading the application.
All is good!

### bin/rails assets:precompile
`/Users/vladikhan` is not writable.
Bundler will use `/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/bundler20261003-48692-w6674u48692' as your home directory temporarily.
yarn install v1.22.22
warning Skipping preferred cache folder "/Users/vladikhan/Library/Caches/Yarn" because it is not writable.
warning Selected the next writable cache folder in the list, will be "/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/.yarn-cache-501".
[1/4] Resolving packages...
[2/4] Fetching packages...
info There appears to be trouble with your network connection. Retrying...
info There appears to be trouble with your network connection. Retrying...
info There appears to be trouble with your network connection. Retrying...
info There appears to be trouble with your network connection. Retrying...
error Error: getaddrinfo ENOTFOUND registry.yarnpkg.com
    at GetAddrInfoReqWrap.onlookupall [as oncomplete] (node:dns:122:26)
info Visit https://yarnpkg.com/en/docs/cli/install for documentation about this command.
I, [2026-10-03T11:09:54.134144 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/manifest-7c370d9536d7d0d6a0f7cd7f9826692acd93e4fb05ba46f7b630b879740343d3.js
I, [2026-10-03T11:09:54.138687 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/manifest-7c370d9536d7d0d6a0f7cd7f9826692acd93e4fb05ba46f7b630b879740343d3.js.gz
I, [2026-10-03T11:09:54.141903 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin-08a87eeccf9bc35b3811cea29f7fba55fbe7035751b3861280b4e3c29c64e839.css
I, [2026-10-03T11:09:54.143853 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin-08a87eeccf9bc35b3811cea29f7fba55fbe7035751b3861280b4e3c29c64e839.css.gz
I, [2026-10-03T11:09:54.147292 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin.css-db63f7ade8839621fc059543a60d5ec7880177d1a9451945aa9102afd4de4bdd.map
I, [2026-10-03T11:09:54.150606 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin.css-db63f7ade8839621fc059543a60d5ec7880177d1a9451945aa9102afd4de4bdd.map.gz
I, [2026-10-03T11:09:54.154326 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/customer-c328b92cc88f537a89227e947f8c8b2d42f72ba0fd595cda5598efa77a2bd047.css
I, [2026-10-03T11:09:54.157750 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/customer-c328b92cc88f537a89227e947f8c8b2d42f72ba0fd595cda5598efa77a2bd047.css.gz
I, [2026-10-03T11:09:54.165046 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/customer.css-2c62d80adbaa76622725880d6a21ed5993e7d6a9c5acfa8eac7a59881cfdaef0.map
I, [2026-10-03T11:09:54.167579 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/customer.css-2c62d80adbaa76622725880d6a21ed5993e7d6a9c5acfa8eac7a59881cfdaef0.map.gz
I, [2026-10-03T11:09:54.198807 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/flash-21d89dbf445ca92fbb73f5e4c1bb22549dd89140515a6ca4e87834450fd31fb8.css
I, [2026-10-03T11:09:54.202110 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/flash-21d89dbf445ca92fbb73f5e4c1bb22549dd89140515a6ca4e87834450fd31fb8.css.gz
I, [2026-10-03T11:09:54.208997 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/flash.css-f167f6f1f238fb91fa36813b14b7b309870483bc5aec278657335d161cd2aef2.map
I, [2026-10-03T11:09:54.210719 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/flash.css-f167f6f1f238fb91fa36813b14b7b309870483bc5aec278657335d161cd2aef2.map.gz
I, [2026-10-03T11:09:54.226677 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/form-1f23dd4718ad9436f7a0fe347fc16ecc6cc46eb7ae68c93baa8d0726dd129fa8.css
I, [2026-10-03T11:09:54.230575 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/form-1f23dd4718ad9436f7a0fe347fc16ecc6cc46eb7ae68c93baa8d0726dd129fa8.css.gz
I, [2026-10-03T11:09:54.237293 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/form.css-ce978256e67a76b58d82534fcbd312dc8b84f0ae11733f92051864287ab3f990.map
I, [2026-10-03T11:09:54.253434 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/form.css-ce978256e67a76b58d82534fcbd312dc8b84f0ae11733f92051864287ab3f990.map.gz
I, [2026-10-03T11:09:54.255754 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/layout-75d34413c3bfe4ef1ddc1b0aa4c3a81c5019788057136a89f188b35b6e012610.css
I, [2026-10-03T11:09:54.256990 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/layout-75d34413c3bfe4ef1ddc1b0aa4c3a81c5019788057136a89f188b35b6e012610.css.gz
I, [2026-10-03T11:09:54.267403 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/pagination-701184cc8fcbe32931d39f90c7d5f811361b4e35aa4525336152f5badf97843c.css
I, [2026-10-03T11:09:54.271675 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/pagination-701184cc8fcbe32931d39f90c7d5f811361b4e35aa4525336152f5badf97843c.css.gz
I, [2026-10-03T11:09:54.280875 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/pagination.css-1fc582c5b9e619845130e14db1218627a73837794c183120fe6eeab5658b5e14.map
I, [2026-10-03T11:09:54.283585 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/pagination.css-1fc582c5b9e619845130e14db1218627a73837794c183120fe6eeab5658b5e14.map.gz
I, [2026-10-03T11:09:54.288735 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/sessions-d4389db893a23ce92751b19a52d105671efa71148363d2329976db684f6201ae.css
I, [2026-10-03T11:09:54.290012 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/admin/sessions-d4389db893a23ce92751b19a52d105671efa71148363d2329976db684f6201ae.css.gz
I, [2026-10-03T11:09:54.306837 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/application-65bdd82e1c9787fc5307daed724f1107b1cea8860b43c723b0dbf4228eb435cd.css
I, [2026-10-03T11:09:54.319614 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/application-65bdd82e1c9787fc5307daed724f1107b1cea8860b43c723b0dbf4228eb435cd.css.gz
I, [2026-10-03T11:09:54.374026 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/application.css-94989f02025bb07974addec7a166042555287c43558678d994d2d225c8755418.map
I, [2026-10-03T11:09:54.375954 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/application.css-94989f02025bb07974addec7a166042555287c43558678d994d2d225c8755418.map.gz
I, [2026-10-03T11:09:54.383269 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/divs_and_spans-79f44596fc10af4f0685e4a8240971d2f848d253bfdb82bca28bceb475bc49d8.css
I, [2026-10-03T11:09:54.385188 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/divs_and_spans-79f44596fc10af4f0685e4a8240971d2f848d253bfdb82bca28bceb475bc49d8.css.gz
I, [2026-10-03T11:09:54.386838 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/divs_and_spans.css-597a2a6ee8d225a3e15af8cefefd032507de654ce9791b9ea8efb4b1cca60cc8.map
I, [2026-10-03T11:09:54.389606 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/divs_and_spans.css-597a2a6ee8d225a3e15af8cefefd032507de654ce9791b9ea8efb4b1cca60cc8.map.gz
I, [2026-10-03T11:09:54.396396 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/flash-21d89dbf445ca92fbb73f5e4c1bb22549dd89140515a6ca4e87834450fd31fb8.css
I, [2026-10-03T11:09:54.404880 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/flash-21d89dbf445ca92fbb73f5e4c1bb22549dd89140515a6ca4e87834450fd31fb8.css.gz
I, [2026-10-03T11:09:54.413424 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/flash.css-af71a75d442956db99d636f19cbddd9c8990c59512ed356ce0268495bf33fc7f.map
I, [2026-10-03T11:09:54.415034 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/flash.css-af71a75d442956db99d636f19cbddd9c8990c59512ed356ce0268495bf33fc7f.map.gz
I, [2026-10-03T11:09:54.416617 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/layout-b7814c82bde36ffccc88a0c3e0e4e17cc291ffca871bfcf3167ea459e983562a.css
I, [2026-10-03T11:09:54.418938 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/layout-b7814c82bde36ffccc88a0c3e0e4e17cc291ffca871bfcf3167ea459e983562a.css.gz
I, [2026-10-03T11:09:54.432042 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/sessions-43b0e9020cde18fcd289a8abcc471a462ca116ddca2117ca0917fdd89ede925a.css
I, [2026-10-03T11:09:54.454965 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/sessions-43b0e9020cde18fcd289a8abcc471a462ca116ddca2117ca0917fdd89ede925a.css.gz
I, [2026-10-03T11:09:54.479646 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/tables-a135eb367a21b83af5e7abe5a10369fff2bcd7ca6a45e92fba6ec6f1efd49e08.css
I, [2026-10-03T11:09:54.483803 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/customer/tables-a135eb367a21b83af5e7abe5a10369fff2bcd7ca6a45e92fba6ec6f1efd49e08.css.gz
I, [2026-10-03T11:09:54.495333 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/shared/errors-ed08316626fca747491223830c38d4b8a7d45dca11ef1565a3f1c6bd8662d7a7.css
I, [2026-10-03T11:09:54.497239 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/shared/errors-ed08316626fca747491223830c38d4b8a7d45dca11ef1565a3f1c6bd8662d7a7.css.gz
I, [2026-10-03T11:09:54.506476 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/container-2b150a25a416b516a6fe9d60f45ecec586106d4b1b712845705e5d4f319ad9cf.css
I, [2026-10-03T11:09:54.508511 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/container-2b150a25a416b516a6fe9d60f45ecec586106d4b1b712845705e5d4f319ad9cf.css.gz
I, [2026-10-03T11:09:54.511037 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/container.css-a517cdd28ccc4e0a4f04ecfd0a79feb62ba5d215c814d9fe69238af747de72e3.map
I, [2026-10-03T11:09:54.512629 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/container.css-a517cdd28ccc4e0a4f04ecfd0a79feb62ba5d215c814d9fe69238af747de72e3.map.gz
I, [2026-10-03T11:09:54.547758 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/divs_and_spans-3c910c7fc074ded50638bfb331f3b7ce5f06b83abceb66d728bdf1d9368b30b3.css
I, [2026-10-03T11:09:54.550059 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/divs_and_spans-3c910c7fc074ded50638bfb331f3b7ce5f06b83abceb66d728bdf1d9368b30b3.css.gz
I, [2026-10-03T11:09:54.578936 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/divs_and_spans.css-15c5ee850b9651ff32b5ea239bdb9a7969df1016dab4c7e0627a86223dded509.map
I, [2026-10-03T11:09:54.580738 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/divs_and_spans.css-15c5ee850b9651ff32b5ea239bdb9a7969df1016dab4c7e0627a86223dded509.map.gz
I, [2026-10-03T11:09:54.582675 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/entries-51216cd2609a0eb7a950564df05fa7df1e3576aa41a45a90aaa9f5c24a8f3d87.css
I, [2026-10-03T11:09:54.587958 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/entries-51216cd2609a0eb7a950564df05fa7df1e3576aa41a45a90aaa9f5c24a8f3d87.css.gz
I, [2026-10-03T11:09:54.590004 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/entries.css-87a43a70e9282d5b76770f909f442942f8d1804aa779c46525ea0c65ebe4292d.map
I, [2026-10-03T11:09:54.591465 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/entries.css-87a43a70e9282d5b76770f909f442942f8d1804aa779c46525ea0c65ebe4292d.map.gz
I, [2026-10-03T11:09:54.610317 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/flash-21d89dbf445ca92fbb73f5e4c1bb22549dd89140515a6ca4e87834450fd31fb8.css
I, [2026-10-03T11:09:54.612906 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/flash-21d89dbf445ca92fbb73f5e4c1bb22549dd89140515a6ca4e87834450fd31fb8.css.gz
I, [2026-10-03T11:09:54.614416 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/flash.css-1e070d717b1dbe2680c2742385721235c0ba4ebcd8022622bb783b9f2ff71a38.map
I, [2026-10-03T11:09:54.617887 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/flash.css-1e070d717b1dbe2680c2742385721235c0ba4ebcd8022622bb783b9f2ff71a38.map.gz
I, [2026-10-03T11:09:54.622168 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/form-13273edf83128476eeca9e1f3a3790f51813cbfe3d690d5cc925f34651b9e559.css
I, [2026-10-03T11:09:54.624505 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/form-13273edf83128476eeca9e1f3a3790f51813cbfe3d690d5cc925f34651b9e559.css.gz
I, [2026-10-03T11:09:54.631949 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/layout-b9257ff7b8d567854e7297b44face03d77805e270471cc019f4df6e889e9089e.css
I, [2026-10-03T11:09:54.634773 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/layout-b9257ff7b8d567854e7297b44face03d77805e270471cc019f4df6e889e9089e.css.gz
I, [2026-10-03T11:09:54.647838 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/layout.css-f5ab1d5ce6748ad40a1c7fc63db3f7993fa77ab600a11003b0af2821b5f6ed63.map
I, [2026-10-03T11:09:54.652842 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/layout.css-f5ab1d5ce6748ad40a1c7fc63db3f7993fa77ab600a11003b0af2821b5f6ed63.map.gz
I, [2026-10-03T11:09:54.658633 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/search-ac45afed7bd552ddc59245e6bc6262ddffa59cb83d841257edddee81a2d1ec46.css
I, [2026-10-03T11:09:54.662407 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/search-ac45afed7bd552ddc59245e6bc6262ddffa59cb83d841257edddee81a2d1ec46.css.gz
I, [2026-10-03T11:09:54.675778 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/search.css-75e62a7b65520eaccbc4741dc3285908a75af2c3ccdb1bccb75da2d6faa9db22.map
I, [2026-10-03T11:09:54.678056 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/search.css-75e62a7b65520eaccbc4741dc3285908a75af2c3ccdb1bccb75da2d6faa9db22.map.gz
I, [2026-10-03T11:09:54.681939 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/sessions-c3743c4ce4cf3856badc20fccd4a14979c914b771b624e82d58d801dc917b6d4.css
I, [2026-10-03T11:09:54.683165 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/sessions-c3743c4ce4cf3856badc20fccd4a14979c914b771b624e82d58d801dc917b6d4.css.gz
I, [2026-10-03T11:09:54.684987 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/sessions.css-9a45ec36af5e15230ebc805523d950abd64f4608a658fa26fdd4e30d8922b8f8.map
I, [2026-10-03T11:09:54.685772 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/sessions.css-9a45ec36af5e15230ebc805523d950abd64f4608a658fa26fdd4e30d8922b8f8.map.gz
I, [2026-10-03T11:09:54.688484 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/tables-c0e12b7579713911d64f08b68614d9498a9eed4807550cb31b2068f4d7631af0.css
I, [2026-10-03T11:09:54.691722 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/staff/tables-c0e12b7579713911d64f08b68614d9498a9eed4807550cb31b2068f4d7631af0.css.gz
I, [2026-10-03T11:09:54.693452 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/tables-94be51ad504a98e1d383be3126fe3fec8aa82bf01eca6dc84f6c1eaecee1f433.css
I, [2026-10-03T11:09:54.694602 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/tables-94be51ad504a98e1d383be3126fe3fec8aa82bf01eca6dc84f6c1eaecee1f433.css.gz
I, [2026-10-03T11:09:54.696965 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/tables.css-b53d975cc42825be1fbfb122c379113affe046e8561457cc980e3e94802af9c5.map
I, [2026-10-03T11:09:54.698005 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/tables.css-b53d975cc42825be1fbfb122c379113affe046e8561457cc980e3e94802af9c5.map.gz
I, [2026-10-03T11:09:54.699886 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/application-c2e4e942672de380cc9bb530b734a87095f31f4a820607438870a06f42c21a5d.js
I, [2026-10-03T11:09:54.701363 #48692]  INFO -- : Writing /Users/vladikhan/IT/RUBY/datora/office/myapp/public/assets/application-c2e4e942672de380cc9bb530b734a87095f31f4a820607438870a06f42c21a5d.js.gz
Everything's up-to-date. Nothing to do

### bin/rails runner 'puts Rails.version'
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `require': cannot load such file -- bootsnap/setup (LoadError)
	from /Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `<top (required)>'
	from bin/rails:3:in `require_relative'
	from bin/rails:3:in `<main>'

### bin/rails routes | head

000
Checking log/development.log for exceptions:
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'

### Checking for deprecation warnings

## After step0 changes

### bundle install
`/Users/vladikhan` is not writable.
Bundler will use `/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/bundler20261003-48920-jtzpuz48920' as your home directory temporarily.
Bundle complete! 25 Gemfile dependencies, 110 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

### bin/rails zeitwerk:check
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `require': cannot load such file -- bootsnap/setup (LoadError)
	from /Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `<top (required)>'
	from bin/rails:3:in `require_relative'
	from bin/rails:3:in `<main>'

### bin/rails assets:precompile
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `require': cannot load such file -- bootsnap/setup (LoadError)
	from /Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `<top (required)>'
	from bin/rails:3:in `require_relative'
	from bin/rails:3:in `<main>'

### bin/rails runner 'puts Rails.version'
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `require': cannot load such file -- bootsnap/setup (LoadError)
	from /Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `<top (required)>'
	from bin/rails:3:in `require_relative'
	from bin/rails:3:in `<main>'

### bin/rails routes | head

000
Checking log/development.log for exceptions:
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'

### Checking for deprecation warnings

### bundle install
`/Users/vladikhan` is not writable.
Bundler will use `/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/bundler20261003-49260-6yfks449260' as your home directory temporarily.
Bundle complete! 27 Gemfile dependencies, 113 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

### bin/rails zeitwerk:check
`/Users/vladikhan` is not writable.
Bundler will use `/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/bundler20261003-49277-8crwff49277' as your home directory temporarily.
Hold on, I am eager loading the application.
## After step0 changes

### bundle install
All is good!

### bin/rails assets:precompile
`/Users/vladikhan` is not writable.
Bundler will use `/var/folders/y7/g6k2h2yd4gl8sy3hkfh7hbzh0000gn/T/bundler20261003-49342-w1yili49342' as your home directory temporarily.
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `require': cannot load such file -- bootsnap/setup (LoadError)
	from /Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `<top (required)>'
	from bin/rails:3:in `require_relative'
	from bin/rails:3:in `<main>'

### bin/rails runner 'puts Rails.version'
Bundle complete! 25 Gemfile dependencies, 110 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.

### bin/rails zeitwerk:check
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `require': cannot load such file -- bootsnap/setup (LoadError)
	from /Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `<top (required)>'
	from bin/rails:3:in `require_relative'
	from bin/rails:3:in `<main>'

### bin/rails routes | head
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `require': cannot load such file -- bootsnap/setup (LoadError)
	from /Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `<top (required)>'
	from bin/rails:3:in `require_relative'
	from bin/rails:3:in `<main>'

### bin/rails assets:precompile
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `require': cannot load such file -- bootsnap/setup (LoadError)
	from /Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `<top (required)>'
	from bin/rails:3:in `require_relative'
	from bin/rails:3:in `<main>'


### bin/rails runner 'puts Rails.version'
000
Checking log/development.log for exceptions:
/Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `require': cannot load such file -- bootsnap/setup (LoadError)
	from /Users/vladikhan/IT/RUBY/datora/office/myapp/config/boot.rb:5:in `<top (required)>'
	from bin/rails:3:in `require_relative'
	from bin/rails:3:in `<main>'

### bin/rails routes | head
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
/usr/local/bundle/gems/actionpack-6.1.7.10/lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
actionpack (6.1.7.10) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'

### Checking for deprecation warnings

## Step 1: Upgrade Rails to 7.0.8

### Plan:
1. Update Gemfile to set rails version to "~> 7.0.8".
