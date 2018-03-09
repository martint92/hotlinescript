module TopicsHelper

    def show_editors(section)
        begin 
            date = section.revisions.first.updated_at.strftime("%m/%d/%Y")
            f_name = User.find(section.audits.last.user_id).first_name
            l_name = User.find(section.audits.last.user_id).last_name
            return "Last edit on: #{date} by: #{f_name} #{l_name}"
        rescue 
            return "--Audit Record Incomplete--"
        end 
    end 
end
