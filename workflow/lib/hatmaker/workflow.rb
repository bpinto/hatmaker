class Hatmaker::Workflow
  attr_reader :author, :description, :download_link, :uid, :name, :version

  def initialize(params)
    @author        = params['author']
    @description   = params['description']
    @download_link = params['download_link']
    @name          = params['name']
    @version       = params['version'].to_f

    @uid           = "#{@author}_#{@name}"
  end

  def to_json
    Oj.dump(self)
  end

  def self.find(workflow)
    results = Hatmaker::Workflow.search workflow.name
    results.find { |result| result.name == workflow.name && result.author == workflow.author }
  end

  def self.search(query)
    query = Regexp.escape(query)

    @workflows ||= AlfredWorkflow.all
    @workflows.select { |workflow| workflow.name =~ /#{query}/i }
  end
end
