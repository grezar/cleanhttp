domain "httpstat.us" do
  https true
  expect "/301" do
    status 301
  end
end
