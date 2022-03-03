class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    #received_one?(item_name)
    # accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false

    def received_one?(item_name)
        self.freebies.any? do |freebie|
            freebie.item_name == item_name
         
            # !!self.freebies.find_by(item_name: item_name) or this works too instead of the two lines above
        end
    end


    
    def give_away(freebie,dev)
        freebie.update(dev: dev) unless freebie.dev != self

        # if freebie.dev_id == self.id         another way of doing the code above
        #     freebie.update(dev_id : dev.id) 
    end
end
