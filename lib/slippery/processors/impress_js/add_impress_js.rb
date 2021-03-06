module Slippery
  module Processors
    module ImpressJs
     class AddImpressJs
       include ProcessorHelpers

       def self.call(doc)
         self.new.call(doc)
       end

       attr_reader :attributes

       DEFAULT_ATTRS = {'transition-duration' => 1000}.freeze

       def initialize(attributes = {})
         @attributes = DEFAULT_ATTRS.merge(attributes).freeze
       end

       def call(doc)
         doc.replace('body') do |body|
           include_local_javascript(body, 'impress.js/js/impress.js')
             .set_attributes({id: 'impress'}.merge(data_attributes(attributes)))
             .add H[:script, "impress().init();"]
         end
       end

     end
   end
 end
end
