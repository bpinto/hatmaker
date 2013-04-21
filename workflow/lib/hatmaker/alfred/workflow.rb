class Hatmaker::Alfred::Workflow
  PATH = File.join(File.dirname(__FILE__), '../../../../..')

  def initialize(params)
    @path = params['path']
    @name = params['name']
  end

  def has_version?
    @version
  end

  def self.all
    Dir.foreach(PATH).map do |folder|
      next if folder =~ /^\./

      Hatmaker::Alfred.info "Folder: #{folder}"
      new 'path' => folder, 'info' => info(folder)
    end
  end

  def self.info(folder)
    Plist::parse_xml(File.read("#{PATH}/#{folder}/info.plist"))
  end
end
