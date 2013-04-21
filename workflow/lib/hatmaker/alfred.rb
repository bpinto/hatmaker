class Hatmaker::Alfred
  def self.info(msg)
    logger.info msg
  end

  def self.error(msg)
    logger.error msg
  end

  private

  def self.logger
    @logger ||= Alfred::Logger.new(100) #TODO: remove this pog
  end
end
