module ReferralsHelper
    require 'digest'
    def css_id(object)
        Digest::SHA256.hexdigest object.to_s
    end
end
