require_relative 'talent_seeds'

class TalentSeeds

  def execute
    reset_ar_settings
    establish_connection(ActiveRecord::Base.configurations[Padrino.env])
    add_talent_seed
  end

  def set_config
    ActiveRecord::Base.configurations[Padrino.env].merge!(:database => "oxygen_service_development",
                                                          :host => "localhost",
                                                          :username => "root",
                                                          :password => "")
  end

  def reset_ar_settings
    set_config
    ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[Padrino.env])
  end

  def establish_connection(request_ctxt)
    ActiveRecord::Base.establish_connection(request_ctxt)
  end

  def add_talent_seed
    talent_seed_list = [{ :talent => 'Music', :sub_talent => 'Vocals'
                        },
                      { :talent => 'Music', :sub_talent => 'Keyboard'
                      },
                      { :talent => 'Music', :sub_talent => 'Guitars'
                      },
                      { :talent => 'Music', :sub_talent => 'Drums'
                      },
                      { :talent => 'Music', :sub_talent => 'Composer'
                      },
                      { :talent => 'Acting', :sub_talent => ''
                      },
                      { :talent => 'Dancing', :sub_talent => 'Bharatanatyam'
                      },
                      { :talent => 'Dancing', :sub_talent => 'Kuchipudi'
                      },
                      { :talent => 'Dancing', :sub_talent => 'Kathak'
                      },
                      { :talent => 'Dancing', :sub_talent => 'Bollywood'
                      },
                      { :talent => 'Films', :sub_talent => 'Direction'
                      },
                      { :talent => 'Films', :sub_talent => 'Cinematography'
                      },
                      { :talent => 'Films', :sub_talent => 'ArtDirection'
                      },
                      { :talent => 'Films', :sub_talent => 'VFX'
                      },
                      { :talent => 'Painting', :sub_talent => ''
                      },
                      { :talent => 'Handicrafts', :sub_talent => ''
                      },
                      { :talent => 'Others', :sub_talent => ''
                      }
    ]
    talent_seed_list.map { |params| Talents.create! params if Talents.find_by_talent_and_sub_talent(params[:talent], params[:sub_talent]).blank? }

  end

end