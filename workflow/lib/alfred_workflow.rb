class AlfredWorkflow
  URL = 'https://raw.github.com/hzlzh/AlfredWorkflow.com/master/workflow_api.json'

  def self.all
    json = open(URL).read
    Oj.load(json).map { |data| Hatmaker::Workflow.new parse_workflow data }
  end

  private

  def self.parse_workflow(data)
    {
      'author'        => data['workflow_author_name'],
      'description'   => data['workflow_description_small'],
      'download_link' => data['workflow_download_link'],
      'filename'      => 'workflow.alfredworkflow',
      'homepage'      => data['workflow_release_page'],
      'name'          => data['workflow_name'],
      'version'       => data['workflow_version']
    }
  end
end
