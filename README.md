

rails generate model Contributor first_name:string last_name:string short_name:string email:string phone:string institution:string country:string contributor_profile:text password_digest:string remember_token:string admin:boolean

bundle exec rake db:migrate


<!-- create_table "contributors", force: true do |t|
  t.string   "first_name"
  t.string   "last_name"
  t.string   "short_name"
  t.string   "email"
  t.string   "phone"
  t.text     "contributor_profile"
  t.integer  "contributor_id"
  t.datetime "created_at"
  t.datetime "updated_at"
  t.string   "password_digest"
  t.string   "remember_token"
  t.boolean  "admin",               default: false
  t.string   "institution"
  t.string   "country"
end -->

.mode tabs
.import area_table_F6.txt areas

