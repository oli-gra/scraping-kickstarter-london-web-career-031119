# require libraries/modules here
require 'nokogiri'
require 'pry'


def create_project_hash
  # write your code here
  kick = Nokogiri::HTML(File.read('fixtures/kickstarter.html'))
  projects = {}
  kick.css("div.project-card").each do |project|
    projects[project.css("h2.bbcard_name strong a").text.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
  projects
end

create_project_hash
