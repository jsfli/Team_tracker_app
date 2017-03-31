require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('the homepage path', {:type => :feature}) do
    it('processes the user entry and returns it title cased') do
      visit('/')
      expect(page).to have_content('Startup')
    end
  end
