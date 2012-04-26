require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RMigreme" do
  it "api" do
    url = "http://www.google.com.br"

    url_short = RMigreme.short(url)
    url_redirect = RMigreme.redirect(url_short)

    url_redirect.should eq(url)
  end

end
