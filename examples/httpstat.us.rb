domain "httpstat.us" do
  https true
  path "/301" do
    location "https://httpstat.us"
  end
end
