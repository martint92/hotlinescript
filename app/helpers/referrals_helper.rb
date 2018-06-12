module ReferralsHelper
    require 'digest'
    def css_id(object)
        Digest::SHA256.hexdigest object.created_at.to_s
    end
end
