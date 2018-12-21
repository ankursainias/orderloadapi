
# cucumber step for checking the API version

Given /^I send and accept JSON using version (\d+) of the (\w+) API$/ do |version, domain|
  header 'Accept', "application/vnd.#{domain}+json; version=#{version}"
  header 'Content-Type', 'application/json'
end