module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_representative

    def connect
      self.current_representative = find_verified_representative
      logger.add_tags 'ActionCable', current_representative.email
    end

    protected

    def find_verified_representative # this checks whether a user is authenticated with devise
      verified_representative = env['warden'].representative
      if verified_representative
        verified_representative
      else
        reject_unauthorized_connection
      end
    end
  end
end
