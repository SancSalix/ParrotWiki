class WikiPolicy < ApplicationPolicy
    attr_reader :wiki
    
    def initialize(user, wiki)
       super(user, wiki)
       @wiki = record
    end
    
     def update?
       user.admin? || wiki.try(:user) == user
     end
     
     def destroy?
       user.admin? 
     end
end