module Hatmaker
  BUNDLE_ID = 'com.github.bpinto.hatmaker'

  def self.setting
    YAML::load(File.read("#{storage_path}/setting.yaml")) rescue {}
  end

  private

  def self.path
    "#{Hatmaker::Alfred::WORKFLOWS_PATH}/#{BUNDLE_ID}"
  end

  def self.storage_path
    "#{Hatmaker::Alfred::STORAGE_PATH}/#{BUNDLE_ID}"
  end
end
