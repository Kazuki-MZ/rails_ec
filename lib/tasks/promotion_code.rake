# frozen_string_literal: true

namespace :promotion_code do
  desc 'create promotion code'
  task generate: :environment do
    PromotionCode.create!([
                            { code_name: 'aD3f2G1', discount_amount: 100 },
                            { code_name: 'bC5k8J6', discount_amount: 200   },
                            { code_name: 'qM7h4P9', discount_amount: 300   },
                            { code_name: 'eX1r5T8', discount_amount: 400   },
                            { code_name: 'zY2u6O0', discount_amount: 500   },
                            { code_name: 'iV4n7E3', discount_amount: 600   },
                            { code_name: 'wS5c9F2', discount_amount: 700   },
                            { code_name: 'pQ6a8R1', discount_amount: 800   },
                            { code_name: 'oL3d5B7', discount_amount: 900   },
                            { code_name: 'mN2x8H4', discount_amount: 1000  }
                          ])
  end
end
